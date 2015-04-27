<cfset plugin = getTap().getIoC().getContainer("plugins").getBean("fusebox") />

<cfoutput>
	<cfsavecontent variable="tap.view.content">
	#htlib.show(docPage(plugin.getValue("name") & " " 
		& plugin.getValue("version") & " " & plugin.getValue("revision")))#
	
	<p>There are a great many dedicated developers in the ColdFusion community, 
	and together they've produced quite a lot of good software. Why should we 
	limit ourselves to only a particular subset of their contributions? This 
	plugin imports existing Fusebox applications to run within the context of 
	your onTap framework application. So for example if you found a forum 
	application that you liked, but you're using the onTap framework and the 
	forum was written in Fusebox, why shouldn't you still be able to use that 
	forum application?</p>
	
	<p>Importing the content from the Fusebox application into your own also 
	helps with issues like single-sign-on wherein you already have a member 
	management system, and you don't want your users to need two separate sets 
	of login credentials for your site (one for the site and another for the forum). 
	Having the application within the context of your existing application 
	framework makes it easier to sync-up the forum user database with your 
	existing user database.</p>
	
	#docSection("Importing An Application")# 
	
	<p>Once you've got the Fusebox importer installed, simply navigate to 
	the plugin manager (you're probably already there), select the manage 
	button next to the Fusebox Importer in your list of plugins. In the 
	Import form at the top, enter a name to identify the imported application, 
	the physical file location of the application's root directory (where 
	the Application.cfc is located) and press the Import button. 
	
	#docSection("Creating an Installer")# 
	
	<p>If you've got a Fusebox application you'd like to distribute via the 
	onTap framework, you can create an installer for your specific application 
	that will help make integration easier. In your installer, all you need to 
	do is fetch the Fusebox container from the framework's IoC Manager and 
	call the install() method.</p>
	
	<p>Example: &lt;cfset getTap().getIoC().getContainer("fusebox").install("myapp",ExpandPath("/path/to/app")) /&gt;</p>
	
	</cfsavecontent>
</cfoutput>
