module PostsHelper
  def choose_index_or_edit
    if action_name == 'index' || action_name == 'create' || action_name == 'confirm'
      confirm_posts_path
    elsif action_name == 'edit'
      post_path(@post.id)
    end
  end
  def random_num
    number = rand(1..6)
    number
  end
end
