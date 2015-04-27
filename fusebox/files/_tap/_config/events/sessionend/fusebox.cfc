<cfcomponent extends="config">
	
	<cffunction name="configure" access="public" output="false" returntype="void" hint="execute event code in this method">
		<cfset getIoC().getContainer("fusebox").ExecuteEvent("onSessionEnd",getApplication(),getSession()) />
	</cffunction>
	
</cfcomponent>