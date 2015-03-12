library(httr)
# 1. Find OAuth settings for github:
# http://developer.github.com/v3/oauth/
oauth_endpoints("github")
# 2. Register an application at https://github.com/settings/applications;
# Use any URL you would like for the homepage URL (http://github.com is fine)
# and http://localhost:1410 as the callback url
#
# Insert your client ID and secret below - if secret is omitted, it will
# look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github", "2f48e44d8b234bb49b8d", "762e3f573ae6db005d1b20d8a8f041200733e12f")
# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)
BROWSE("https://api.github.com/users/jtleek/repos",authenticate("Access Token","x-oauth-basic","basic"))
# OR:
#req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
#stop_for_status(req)
#content(req)
