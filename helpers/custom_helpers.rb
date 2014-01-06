def main_menu_item name, link, description
  link_to "#{name}<span><span class='hidden-desktop'>-</span>#{description}</span>", link
end

def portfolio_tags
  tags = []
  data.portfolio.list.each do |f|
    tags = tags | f.tags
  end
  tags
end