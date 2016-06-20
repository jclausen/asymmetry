<cfoutput>				
<footer id="footer">
	 <!--- contentboxEvent --->
	 #cb.event( "cbui_footer" )#
	 <div id="footer-main">
		<div class="container">
			<div class="col-md-4">
				<div class="panel">
					<div class="panel-heading">
						<h2>Recent Entries</h2>
					</div>
					<div class="panel-body">
						#cb.widget( name='RecentEntries',args={showExcerpt=false,widgetTemplate='medialist'} )#
					</div>
				</div><!--- end recent entries panel --->
			</div>
			<div class="col-md-4">
				<div class="panel article">
					<cfif cb.themeSetting( 'hpArticleText','' ) is not "">
						<div class="panel-heading">
							<h2>#cb.themeSetting( 'hpArticleTitle','' )#</h2>
						</div>
						<div class="panel-body article-content">
							<cfif cb.themeSetting( 'hpArticleImg','' ) is not ''>
								<img class="img-responsive article-img" src="#cb.themeSetting( 'hpArticleImg','' )#" alt="#cb.themeSetting( 'hpArticleTitle','' )#">
							</cfif>
							<div class="article-text">#cb.themeSetting( 'hpArticleText','' )#</div>
							<cfif cb.themeSetting( 'hpArticleBtnURL','' ) is not ''>
								<a class="more-link" herf="#cb.themeSetting( 'hpArticleBtnURL','' )#">#cb.themeSetting( 'hpArticleBtnText','More' )#</a>
							</cfif>
						</div>
					</cfif>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel">
					<div class="panel-heading">
						<h2>Categories</h2>
					</div>
					<!---
					Display Categories using ContentBox collection template rendering
					the default convention for the template is "category.cfm" you can change it via the quickCategories() 'template' argument.
					--->
					<div class="panel-body">
						<ul class="cat-list">
							#cb.quickCategories()#		
						</ul>
					</div>
				</div><!--- end categories panel --->
			</div>
		</div>
	</div>
	 <div id="copyright">
		<div class="container">
			<div class="col-md-4">
				<cfif cb.themeSetting( 'locAddress', '' ) is not "">
					<div class="address-footer">
						<span class="glyphicon glyphicon-map-marker"></span>
						<span class="loc-text">
							<span>#cb.themeSetting( 'locAddress' )#</span><br/>
							<span>#cb.themeSetting( 'locCity' )#</span>, 
							<span>#cb.themeSetting( 'locState' )#</span> 
							<span>#cb.themeSetting( 'locZip' )#</span>
						<span>
					</div>
				</cfif>
				<cfif cb.themeSetting( 'locPhone', '' ) is not "">
					<div class="phone-footer">
						<span class="glyphicon glyphicon-earphone"></span>
						<span class="loc-text">#cb.themeSetting( 'locPhone' )#</span>
					</div>
				</cfif>
				<cfif cb.themeSetting( 'locEmail', '' ) is not "">
					<div class="email-footer">
						<span class="glyphicon glyphicon-envelope"></span>
						<span class="loc-text">
							<a href="mailto:#cb.themeSetting( 'locEmail' )#">#cb.themeSetting( 'locEmail' )#</a>
						</span>
					</div>
				</cfif>
				
			</div>
			<div class="col-md-4 text-center">
				<cfif cb.themeSetting( 'headerLogo', '' ) is not "">
					<div>
						<a href="#cb.linkHome()#" class="brand-img" title="#cb.siteTagLine()#" data-toggle="tooltip">
							<img src="#cb.themeSetting( 'headerLogo' )#" alt="#cb.siteName()#">
						</a>
					</div>
				</cfif>
				<p class="">Copyright &copy; #cb.siteName()#.  All rights reserved.</p>
				<p class="">Powered by ContentBox v#cb.getContentBoxVersion()#</p></div>
			<div class="col-md-4">
				<div class="social">
					<cfif cb.themeSetting( 'socialFB', '' ) is not "">
					<span class="fa-stack fa-1x">
						<a href="#cb.themeSetting( 'socialFB' )#">
							<span class="sr-only">Visit our Facebook page</span>
							<span class="fa fa-circle fa-stack-2x"></span>
							<span class="fa fa-facebook fa-stack-1x textWhite"></span>
						</a>
					</span>
				</cfif>
				<cfif cb.themeSetting( 'socialT', '' ) is not "">
					<span class="fa-stack fa-1x">
						<a href="#cb.themeSetting( 'socialT' )#">
							<span class="sr-only">Twitter</span>
							<span class="fa fa-circle fa-stack-2x"></span>
							<span class="fa fa-twitter fa-stack-1x textWhite"></span>
						</a>
					</span>
				</cfif>
				<cfif cb.themeSetting( 'socialGP', '' ) is not "">
					<span class="fa-stack fa-1x">
						<a href="#cb.themeSetting( 'socialGP' )#">
							<span class="sr-only">Google+</span>
							<span class="fa fa-circle fa-stack-2x"></span>
							<span class="fa fa-google-plus fa-stack-1x textWhite"></span>
						</a>
					</span>
				</cfif>
				<cfif cb.themeSetting( 'socialIG', '' ) is not "">
					<span class="fa-stack fa-1x">
						<a href="#cb.themeSetting( 'socialIG' )#">
							<span class="sr-only">Instagram</span>
							<span class="fa fa-circle fa-stack-2x"></span>
							<span class="fa fa-instagram fa-stack-1x textWhite"></span>
						</a>					
					</span>
				</cfif>
				<cfif cb.themeSetting( 'socialYT', '' ) is not "">
					<span class="fa-stack fa-1x">
						<a href="#cb.themeSetting( 'socialYT' )#">
							<span class="sr-only">YouTube</span>
							<span class="fa fa-circle fa-stack-2x"></span>
							<span class="fa fa-youtube fa-stack-1x textWhite"></span>
						</a>					
					</span>
				</cfif>
			</div>
		</div>
	</div>
</footer>
</cfoutput>