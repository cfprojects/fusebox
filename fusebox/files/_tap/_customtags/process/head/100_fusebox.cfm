<cfset temp = getTap().getPage().head />
<cfparam name="temp.fusebox" type="string" default="" />
<cfoutput>#temp.fusebox#</cfoutput>
