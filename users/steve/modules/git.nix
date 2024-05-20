{ pkgs, ... }:
{
  programs.git = {
    enable = true;
  
    extraConfig = {
      init.defaultBranch = "main";
    };

    aliases = {
      co = "checkout";
      cob = "checkout -b";
      coo = "!git fetch && git checkout";
  
      br = "branch";
      brd = "branch -d";
      brD = "branch -D";

      st = "status";

      aa = "add -A .";
      ap = "add -p .";
      cm = "commit -m";
      aacm = "!git add -A . && git commit -m";

      cp = "cherry-pick";
      amend = "commit --amend -m";
      unstage = "reset --soft HEAD^";
      rsh = "!git reset --hard origin/`git branch --show-current`";
    
      po = "push origin";
      pu = "!git push origin `git branch --show-current`";
      pom = "push origin main";
      poh = "push origin HEAD";
      plo = "pull origin";
      plom = "pull origin main";
      ploh = "pull origin HEAD";

      ls = "log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate";
      ll = "log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --numstat";

      f = "'!git ls-files | grep -i'";
      gr = "grep -Ii";
      la = "'!git config -l | grep alias | cut -c 7-'";
    };
  };
}
