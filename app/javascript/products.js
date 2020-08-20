$(document).on('turbolinks:load', ()=> {
  const buildImg = (index, url) => {
    const html = `<img data-index="${index}" src="${url}" width="100px">`;
    return html;
  }

  const buildFileField = (index) =>{
    const html = `<div class="jsFile_group" data-index="${index}">
                    <input class="jsFile" type="file" name="item[item_images_attributes][${index}][image]" id = "item_item_images_${index}_image"><br>
                    <div class="jsRemove">削除</div>
                  </div>`;
    return html;
  }
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.jsFile_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hiddenDestroy').hide();

  $('#imageBox').on('change', '.jsFile', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0]
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index = "${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      $('#imageBox').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#imageBox').on('click', '.jsRemove', function() {
    $(this).parent().remove();
    const targetIndex = $(this).parent().data('index')
    const hiddenCheck = $(`input[data-index = "${targetIndex}"].hiddenDestroy`)
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    if ($('.jsFile').length == 0) $('#imageBox').append(buildFileField(fileIndex[0]));
    $(`img[data-index= ${targetIndex}]`).remove();
  });
});