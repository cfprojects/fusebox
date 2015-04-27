<!--- this file displays a form to allow the user to add or remove fusebox apps --->

<cf_html return="temp" parent="#pluginmanager.view.main#">
	<div xmlns:tap="xml.tapogee.com" 
	style="border:solid black 1px; background-color: #F0F0FF; width: 600px; padding: 10px; -moz-border-radius: 8px;">
		<cfif plugin.isInstalled()>
			<div style="text-align:right;">
				<a href="index.cfm">Return to Plugin Manager</a>
			</div>
		</cfif>
		
		<form tap:domain="C" tap:variable="installForm">
			<input type="hidden" name="netaction" value="<cfoutput>#plugin.getValue('source')#</cfoutput>/install/configure/complete" />
			
			<script>
				<tap:function name="setAppName" arguments="element">
					var appname = element.value; 
					var frm = element.form; 
					frm.location.value = '<cfoutput>#jsstringformat(expandpath('/'))#</cfoutput>' + appname; 
					frm.path.value = appname + '/index'; 
				</tap:function>
			</script>
			
			<table cellpadding="0" cellspacing="5" style="font-family: Verdana, Geneva, sans-serif;">
				<tr>
					<td>Application Name</td>
					<td>File Location</td>
					<td>Local Path</td>
				</tr>
				<tr>
					<td><input type="text" name="appname" onchange="setAppName(element);" onkeyup="setAppName(element);" /></td>
					<td><input type="text" name="location" value="#ExpandPath('/')#" /></td>
					<td><input type="text" name="path" /></td>
					<td>
						<button type="submit">
							<cfif plugin.isInstalled()>Import<cfelse>Install</cfif>
						</button>
					</td>
				</tr>
				<tr style="font-size:x-small;">
					<td>What do you call it?</td>
					<td>Where is Application.cfc?</td>
					<td>Where do you want it?</td>
				</tr>
			</table>
		</form>
		
		<cfset ioc = getTap().getIoC() />
		<cfif ioc.hasContainer("fusebox")>
			<cfset rsFusebox = ioc.getContainer("fusebox").getImportedApplicationList() />
			<cfif rsFusebox.recordcount>
				<a href="?netaction=<cfoutput>#plugin.getValue('source')#</cfoutput>/remove&amp;remove=all">Remove All</a>
				<table tap:query="rsFusebox">
					<tap:column label="name" sort="" />
					<tap:column label="location" sort="" />
					<tap:column label="path" sort="" />
					<tap:column label="remove" type="dynamic" sort=""><![CDATA[ 
						<a href="<cfoutput>#getLib().getURL('','C')#netaction=#plugin.getValue('source')#</cfoutput>/remove&amp;remove=#name#" style="color:red;">X</a>
					]]></tap:column>
				</table>
			<cfelse>
				<a href="?netaction=<cfoutput>#plugin.getValue('source')#</cfoutput>/remove&amp;remove=fusebox">Uninstall Fusebox Importer</a>
			</cfif>
		</cfif>
	</div>
</cf_html>
