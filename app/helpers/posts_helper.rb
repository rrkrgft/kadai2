module PostsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_posts_path
    elsif action_name == 'edit'
      post_path
    end
  end

  def user_check
    @post.user.id == current_user.id
  end
end
