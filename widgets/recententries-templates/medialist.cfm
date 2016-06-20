<cfoutput>
	<!--- title  --->
	<cfif len( arguments.title ) >
		<h#arguments.titleLevel#>#arguments.title#</h#arguments.titleLevel#>
	</cfif>
	
	<!--- ul start  --->		
	<ul class="media-list recent-entries">
		<!--- iterate and create --->
		<cfloop index = "x" from = "1" to = #arguments.max# >
			<li class="media recent-entry">
				<cfif entryResults.entries[ x ].getFeaturedImageURL() is not "">
					<div class="media-left">
						<a href="#cb.linkEntry( entryResults.entries[ x ] )#">
							<img src="#entryResults.entries[ x ].getFeaturedImageURL()#" alt="#entryResults.entries[ x ].getTitle()#" class="media-object entry-pic"/>
						</a>
					</div>
				</cfif>
				<div  class="media-body">
					<a href="#cb.linkEntry(entryResults.entries[ x ])#">
						<span class="entry-title">#entryResults.entries[ x ].getTitle()#
					</a>
					<cfif arguments.showDate>
						<span class="entry-date">#DateFormat( entryResults.entries[ x ].getDisplayPublishedDate(), 'mmm d, yyyy' )#</span>
					</cfif>
					<cfif arguments.showExcerpt>
						<span class="entry-excerpt">#entryResults.entries[ x ].getExcerpt()#</span>
					</cfif>
				</div>
			</li>
		</cfloop>
	<!--- close ul --->
	</ul>
</cfoutput>