<cfoutput>
	<!--- title  --->
	<cfif len( arguments.title ) >
		<h#arguments.titleLevel#>#arguments.title#</h#arguments.titleLevel#>
	</cfif>
	
	<!--- ul start  --->		
	<ul class="recentEntries">
		<!--- iterate and create --->
		<cfloop index = "x" from = "1" to = #arguments.max# >
			<li class="recentEntry">
				<a href="#cb.linkEntry(entryResults.entries[ x ])#">#entryResults.entries[ x ].getTitle()#</a>
				<cfif arguments.showExcerpt>
					<span class="entryExcerpt">#entryResults.entries[ x ].getExcerpt()#</span>
				</cfif>
				<cfif arguments.showDate>
					<span class="entryDate">#entryResults.entries[ x ].getDisplayPublishedDate()#</span>
				</cfif>
			</li>
		</cfloop>
	<!--- close ul --->
	</ul>
</cfoutput>