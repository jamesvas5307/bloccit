module TopicsHelper
  def user_is_authorized_for_topics?
    current_user && current_user.admin?
  end

  def user_is_authorized_for_moderatation_of_topic?
    current_user && (current_user.admin? || current_user.moderator?)
  end
end
