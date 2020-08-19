$(document).on('turbolinks:load', function() { 
  $(function(){
    function appendOption(category){
      var html = `<option value="${category.id}">${category.name}</option>`;
      return html;
    }
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = ` <div class="category__child" id="children_wrapper">
                            <select id="child__category" name="item[category_id]" class="formBox__select">
                              <option value="">---</option>
                              ${insertHTML}
                          </select>
                        </div>`;
      $('#formBoxCategory').append(childSelectHtml);
    }
    function appendGrandchidrenBox(insertHTML) {
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class="category__child" id="grandchildren_wrapper">
                                <select id="grandchild__category" name="item[category_id]" class="formBox__select">
                                  <option value="">---</option>
                                    ${insertHTML}
                                </select>
                              </div>`;
      $('#formBoxCategory').append(grandchildSelectHtml);
    }
    $('#parent_category').on('change', function(){
      var parent_category_id = document.getElementById('parent_category').value;
        if (parent_category_id != "---"){
          $.ajax({
            url: ' /items/get_category_children',
            type: 'GET',
            data: { parent_id: parent_category_id },
            dataType: 'json'
          })
          .done(function(children){
            $('#children_wrapper').remove(); 
            $('#grandchildren_wrapper').remove();
            var insertHTML = '';
            children.forEach(function(child){
              insertHTML += appendOption(child)
            });
            appendChidrenBox(insertHTML);
          })
          .fail(function(){
            alert('カテゴリー取得に失敗しました');
          })
      } else {
        $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
      }
    });
    $('.formBox').on('change', '#child__category', function(){
      var childId = document.getElementById('child__category').value;
      if (childId != "---"){
        $.ajax({
          url: ' /items/get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
            $('#grandchildren_wrapper').remove(); 
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました。')
        })
      } else {
        $('#grandchildren_wrapper').remove();
      }
    });
  });
});