# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  jQuery ->
    updateTotal = () ->
      total_count = 0
      $(".receipt-row > .cost").each(
          () -> total_count+=Number($(this).text())
      )
      $(".receipt-total-value").text(total_count)
    
    updateIndexes = () ->
      $(".receipt-row").each((index, obj) ->
        $(obj).find(".index").text(index + 1)
      )
    
    updateRow = (receipt_row) ->
      price = receipt_row.find('option:selected').attr('data-item-price')
      count = receipt_row.find("input.item-price-count").val()
      return if !price?
      receipt_row.find(".price").text(price)
      receipt_row.find(".cost").text(Math.round(100*price * count) / 100)

    updatePrices = () ->
      $(".receipt-row").each((index, item) ->updateRow($(item)))
      updateTotal()

    $("form").on 'change', '.item-price-count', (event) ->
      updateRow($(this).closest('.receipt-row'))
      updateTotal()

    $("form").on 'click', '.add_fields', (event) ->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      console.log($(this).data('fields').replace(regexp, time));
      target = $(this).data('target')
      obj = $(this).data('fields').replace(regexp, time)
      if target?
        $(target).append(obj) 
      else
        $(this).before(obj);
      updateIndexes()
      event.preventDefault()
    updatePrices()
    updateIndexes()