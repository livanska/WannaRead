  
$ ->
  if $('.pagination').length && $('#books').length
    $(window).scroll ->
      url = $('.pagination .next a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text('Loading...')
        $.getScript('/assets/books/index.js.erb')
    $(window).scroll()