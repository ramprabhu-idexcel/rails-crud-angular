module ApplicationHelper
  def remote_get(path,target_tag_id)
    "$.post('/admin/user_products/dynamic_select?#{path}=' + $('##{path}').val(),
            function(data) {$('##{target_tag_id}').html(data);$('##{target_tag_id}').select2('data', null);}
    );"
  end
end


