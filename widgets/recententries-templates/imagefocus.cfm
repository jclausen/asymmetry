<cfoutput>
	<div class="image-focus-entries">
		<cfswitch expression="#entryResults.count#" >
			<cfcase value="1" >
				<div class="col-sm-12 image-focus-col image-focus-entry" style="background-image:url( #entryResults.entries[ 1 ].getFeaturedImageURL()# )">
					<div class="image-focus-overlay">
						<div class="image-focus-content">
							<h2>#entryResults.entries[ 1 ].getTitle()#</h2>
							#entryResults.entries[ 1 ].getExcerpt()#
						<div class="image-focus-content">
					</div>	
				</div>
			</cfcase>
			<cfcase value="2" >
				<div class="col-sm-6 image-focus-col image-focus-entry" style="background-image:url( #entryResults.entries[ 1 ].getFeaturedImageURL()# )">
					<div class="image-focus-overlay">
						<div class="image-focus-content">
							<h2>#entryResults.entries[ 1 ].getTitle()#</h2>
							#entryResults.entries[ 1 ].getExcerpt()#
						<div class="image-focus-content">
					</div>		
				</div>
				<div class="col-sm-6 image-focus-col image-focus-entry" style="background-image:url( #entryResults.entries[ 2 ].getFeaturedImageURL()# )">			
					<div class="image-focus-overlay">
						<div class="image-focus-content">
							<h2>#entryResults.entries[ 2 ].getTitle()#</h2>
							#entryResults.entries[ 2 ].getExcerpt()#
						</div>
					</div>	
				</div>
			</cfcase>
			<cfdefaultcase >
				<div class="col-sm-6 image-focus-col">
					<div class="row image-focus-row-sm">
						<div class="col-sm-6 image-focus-col image-focus-entry" style="background-image:url( #entryResults.entries[ 1 ].getFeaturedImageURL()# )">
							<div class="image-focus-overlay">
								<div class="image-focus-content">
									<h2>#entryResults.entries[ 1 ].getTitle()#</h2>
									#entryResults.entries[ 1 ].getExcerpt()#
								</div>
							</div>	
						</div>
						<div class="col-sm-6 image-focus-col image-focus-entry" style="background-image:url( #entryResults.entries[ 2 ].getFeaturedImageURL()# )">
							<div class="image-focus-overlay">
								<div class="image-focus-content">
									<h2>#entryResults.entries[ 2 ].getTitle()#</h2>
									#entryResults.entries[ 2 ].getExcerpt()#
								</div>
							</div>
						</div>
					</div>
					<div class="row image-focus-row-lg">
						<div class="col-sm-12 image-focus-col image-focus-entry" style="background-image:url( #entryResults.entries[ 3 ].getFeaturedImageURL()# )">
							<div class="image-focus-overlay">
								<div class="image-focus-content">
									<h2>#entryResults.entries[ 3 ].getTitle()#</h2>
									#entryResults.entries[ 3 ].getExcerpt()#
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 image-focus-col">
					<div class="row image-focus-row-lg">
						<div class="col-sm-12 image-focus-col image-focus-entry" style="background-image:url( #entryResults.entries[ 4 ].getFeaturedImageURL()# )">
							<div class="image-focus-overlay">
								<div class="image-focus-content">
									<h2>#entryResults.entries[ 4 ].getTitle()#</h2>
									#entryResults.entries[ 4 ].getExcerpt()#
								</div>
							</div>
						</div>
					</div>
					<div class="row image-focus-row-sm">
						<div class="col-sm-12 image-focus-col image-focus-entry" style="background-image:url( #entryResults.entries[ 5 ].getFeaturedImageURL()# )">
							<div class="image-focus-overlay">
								<div class="image-focus-content">
									<h2>#entryResults.entries[ 5 ].getTitle()#</h2>
									#entryResults.entries[ 5 ].getExcerpt()#
								</div>
							</div>
						</div>
					</div>
				</div>
			</cfdefaultcase>
		</cfswitch>
	</div>
</cfoutput>