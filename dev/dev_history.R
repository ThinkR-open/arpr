usethis::use_build_ignore("dev/")

# To github
usethis::use_git()
usethis::use_github()

# Doc
usethis::use_news_md()
usethis::use_readme_rmd()
usethis::use_package_doc()
usethis::use_pipe()
devtools::build_readme()

# CI
usethis::use_github_action_check_standard()
usethis::use_github_action("pkgdown")
usethis::use_testthat()
usethis::use_test("extensions")
usethis::use_github_action("test-coverage")

# Development ----
attachment::att_amend_desc()

# Check content
# remotes::install_github("ThinkR-open/checkhelper")
tags <- checkhelper::find_missing_tags()
View(tags)
