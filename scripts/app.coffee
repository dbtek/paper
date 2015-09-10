---
---

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
  json: '/search.json'
  searchResultTemplate: '<a class="mdl-menu__item" href="{url}">{title}</a>'
  noResultsText: '<a class="mdl-menu__item" disabled>No results.</a>'
