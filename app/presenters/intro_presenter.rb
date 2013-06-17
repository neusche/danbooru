class IntroPresenter
  def popular_tags
    Tag.order("post_count desc").limit(8).map(&:name)
  end

  def each
    popular_tags.each do |tag|
      yield(tag, PostSets::Post.new(tag, 1, 6))
    end
  end
end