{ pkgs, ... }: {
  programs.newsboat = {
    enable = true;
    urls = [
      {
        url = "https://optozorax.github.io/atom.xml";
        tags = [ "ru" "pr" "blog" ];
      }
      {
        url = "https://hen.ee/feed.xml";
        tags = [ "en" "pr" "blog" ];
      }
      {
        url = "https://jacobwsmith.xyz/rss.xml";
        tags = [ "en" "pr" "blog" ];
      }
    ];
  };
}
