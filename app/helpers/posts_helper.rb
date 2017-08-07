module PostsHelper
  def user_is_authorized_for_admin?(post)
    current_user && (current_user == post.user || current_user.admin?)
  end

  def user_is_authorized_for_moderation_of_post?(post)
    current_user && (current_user == post.user || current_user.admin? || current_user.moderator?)
  end
end
