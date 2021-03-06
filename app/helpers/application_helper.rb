module ApplicationHelper


  def rank_to_i laser_gem
    return 0 unless laser_gem.total_rank
    (laser_gem.total_rank * 100).to_i
  end

  def ext_link(name = nil, options = nil, html_options = nil, &block)
    target_blank = {target: "_blank"}
    if block_given?
      options ||= {}
      options = options.merge(target_blank)
    else
      html_options ||= {}
      html_options = html_options.merge(target_blank)
    end
    link_to(name, options, html_options, &block)
  end

  def tag_validation(tag)
    return "Tag is empty" if tag.blank?
    return "Tag may not contain spaces" if tag.include?(" ")
    return "Tag must be longer than 1" if tag.length == 1
  end

end
