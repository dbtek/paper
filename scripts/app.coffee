---
---

# app initialize operations
initialize = ->
  # set min height of container
  containerElem = document.getElementById 'container'
  footerElem = document.getElementById 'footer'
  toolbarElem = document.getElementById 'toolbar'
  containerElem.style.minHeight = "#{window.innerHeight - footerElem.offsetHeight - toolbarElem.offsetHeight}px"
  # bind resize event
  window.onresize = ->
    containerElem.style.minHeight = "#{window.innerHeight - footerElem.offsetHeight - toolbarElem.offsetHeight}px"

  # init search
  do initSearch

# initializes search functionality via jekyll-search
initSearch = ->
  searchInputElem = document.getElementById 'search-input'
  resultsElem = document.getElementById 'search-results'

  # create mdl menu
  resultsMenu = new MaterialMenu resultsElem
  resultsMenu.forElement_ = searchInputElem

  searchInputElem.onkeyup = ->
    resultsMenu.show()

  searchInputElem.onBlur = ->
    resultsMenu.hide()

  # instantiate jekyll-search
  SimpleJekyllSearch
    searchInput: searchInputElem
    resultsContainer: resultsElem
    json: '{{ "search.json" | prepend: site.baseurl | prepend: site.url }}'
    searchResultTemplate: '<a class="mdl-menu__item" href="{url}">{title}</a>'
    noResultsText: '<a class="mdl-menu__item" disabled>No results.</a>'


# fire application
do initialize
