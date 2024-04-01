{ ... }: {
  programs.newsboat = {
    enable = true;
    urls = [{
      url = "https://computer.rip/rss.xml";
      title = "Computer.rip";
    }];
  };
}
