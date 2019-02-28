class LandingPage
  class << self 

    element   :article_title,               '[data-test="article-title"]'
    element   :related_articles_container,  '[data-test="article-preview-container"]'
    elements  :related_article_buttons,     '[data-test="article-preview-button"]'

  end
end
