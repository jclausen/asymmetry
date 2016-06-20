<cfoutput>
	<!--- Mini RSS --->
	<li>
		<a class="floatRight rss-link" href="#cb.linkRSS(category=category)#" title="RSS Feed For #category.getCategory()#">
			<i class="fa fa-rss"></i>
		</a>
		<!--- Category --->
		<a href="#cb.linkCategory(category)#" title="Filter by #category.getCategory()#">
			<span class="cat">#category.getCategory()#</span> 
			<span class="cat-count">(#category.getNumberOfEntries()#)</span>
		</a>
	</li>
</cfoutput>