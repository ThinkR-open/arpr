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
usethis::use_roxygen_md()

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

# Check spelling
# usethis::use_spell_check()
spelling::spell_check_package()

# Check URL are correct
# remotes::install_github("r-lib/urlchecker")
urlchecker::url_check()
urlchecker::url_update()

# _rhub
devtools::check_rhub()
rhub::check_on_windows(check_args = "--force-multiarch")
rhub::check_on_solaris()
rhub::check(platform = "debian-clang-devel")
rhub::check_for_cran()

# _win devel
devtools::check_win_devel()
devtools::check_win_release()

# Add comments for CRAN
usethis::use_cran_comments(open = rlang::is_interactive())

# Upgrade version number
usethis::use_version(which = c("patch", "minor", "major", "dev")[1])

# Verify you're ready for release, and release
devtools::release()
