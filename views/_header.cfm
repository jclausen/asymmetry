<cfoutput>
<cfset prc.headerMainNav = cb.themeSetting( 'headerMainNav', 'none' )>
<header>
	<div class="container">
		<div class="col-md-2">
			<div class="title">
				<cfif cb.themeSetting( 'headerLogo', '' ) is "">
					<h1>
						<a href="#cb.linkHome()#" class="navbar-brand" title="#cb.siteTagLine()#" data-toggle="tooltip"><strong>#cb.siteName()#</strong></a>
					</h1>
				<cfelse>
					<h1 class="brand-h1-img">
						<a href="#cb.linkHome()#" class="navbar-brand brand-img" title="#cb.siteTagLine()#" data-toggle="tooltip"><img src="#cb.themeSetting( 'headerLogo' )#" alt="#cb.siteName()#"></a>
					</h1>
				</cfif>
			</div><!--- end title --->
		</div>
		<div class="col-md-8">
			<nav class="navbar navbar-main" id="nav-main">
				<div class="navbar-header" >
						<button type="button" id="cb-navbar-toggle" class="navbar-toggle collapsed" data-toggle="collapse" data-target="##cb-nav-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						
					</div>
			
					<!--- Generate Menu --->
					<div class="collapse navbar-collapse" id="cb-nav-collapse">
						<cfif prc.headerMainNav is "none">
							<ul class="nav navbar-nav">
								<cfset menuData = cb.rootMenu( type="data", levels="2" )>
				
								<!--- Iterate and build pages --->
								<cfloop array="#menuData#" index="menuItem">
									<cfif structKeyExists( menuItem, "subPageMenu" )>
										<li class="dropdown">
											<a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title# <b class="caret"></b></a>
											#buildSubMenu( menuItem.subPageMenu )#
										</li>
									<cfelse>
										<cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
											<li class="active">
										<cfelse>
											<li>
										</cfif>
											<a href="#menuItem.link#">#menuItem.title#</a>
										</li>
									</cfif>
								</cfloop>
				
								<!--- Blog Link, verify active --->
								<cfif ( !prc.cbSettings.cb_site_disable_blog )>
									<cfif cb.isBlogView()><li class="active"><cfelse><li></cfif>
										<a href="#cb.linkBlog()#">Blog</a>
									</li>
								</cfif>
							</ul>
						<cfelse>
							#cb.menu( prc.headerMainNav )#
						</cfif>
					</div>
			</nav>
		</div>
		<!--- Search Bar --->
		<div id="header-search">
			<form id="searchForm" name="searchForm" method="post" action="#cb.linkContentSearch()#" class="searchbox">
				<input type="text" class="searchbox-input" placeholder="search" name="q" id="q" value="#cb.getSearchTerm()#"  onkeyup="buttonUp();">
				<button type="submit" class="btn btn-default searchbox-submit"></button>
				<span class="searchbox-icon">
					<span class="glyphicon glyphicon-search"></span>
					<span class="sr-only">Search</span>
				</span>
			</form>
		</div>
	</div>
</header>
<cfscript>
any function buildSubMenu( required menuData ){
	var menu = '<ul class="dropdown-menu">';
	for( var menuItem in arguments.menuData ){
		if( !structKeyExists( menuItem, "subPageMenu" ) ){
			menu &= '<li><a href="#menuItem.link#">#menuItem.title#</a></li>';
		} else {
			menu &= '<li class="dropdown-submenu"><a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title#</a>';
			menu &= buildSubMenu( menuItem.subPageMenu );
			menu &= '</li>';
		}
	}
	menu &= '</ul>';

	return menu;
}
</cfscript>
</cfoutput>