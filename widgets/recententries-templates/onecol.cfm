<cfoutput>
	<!--- title  --->
	<cfif len( arguments.title ) >
		<h#arguments.titleLevel# class="text-center">#arguments.title#</h#arguments.titleLevel#>
	</cfif>
	
	<!--- ul start  --->		
	<div class="recent-etries">
		<!--- iterate and create --->
		<cfloop index = "x" from = "1" to = #arguments.max# >
			<div class="recent-entry col-md-12">
				<h#( arguments.titleLevel + 1 )#>
					<a href="#cb.linkEntry( entryResults.entries[ x ] )#">
						<span class="entry-title">#entryResults.entries[ x ].getTitle()#</span>
					</a>
				</h#( arguments.titleLevel + 1 )#>
				<cfif arguments.showDate>
					<span class="entry-date">#DateFormat( entryResults.entries[ x ].getDisplayPublishedDate(), 'mmm d, yyyy' )#</span><br/>
				</cfif>
				<cfif entryResults.entries[ x ].getFeaturedImageURL() is not "">
					<div>
						<img src="#entryResults.entries[ x ].getFeaturedImageURL()#" alt="#entryResults.entries[ x ].getTitle()#" />
					</div>
				</cfif>
				<cfif arguments.showExcerpt>
					<div class="entry-excerpt"> #entryResults.entries[ x ].getExcerpt()#</div>
				</cfif>
			</div>
		</cfloop>
	<!--- close ul --->
	</div>
</cfoutput>