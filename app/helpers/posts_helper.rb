module PostsHelper
  def choose_index_or_edit
    if action_name == 'index' || action_name == 'create'
      confirm_posts_path
    elsif action_name == 'edit'
      post_path(@post.id)
    end
  end
end
