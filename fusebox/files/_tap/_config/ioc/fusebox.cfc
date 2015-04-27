<cfcomponent extends="config" hint="manages Fusebox Application objects">
	
	<cffunction name="configure" access="public" output="false" returntype="void" hint="attach IoC containers to the manager here">
		<cfset var adapter = CreateObject("component","cfc.fusebox.appmanager").init() />
		<cfset addContainer("fusebox",adapter) />
	</cffunction>
	
</cfcomponent>