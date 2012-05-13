require 'formula'

class Phpmyadmin < Formula
  homepage 'http://www.phpmyadmin.net'
  url 'http://downloads.sourceforge.net/project/phpmyadmin/phpMyAdmin/3.5.1/phpMyAdmin-3.5.1-english.tar.bz2'
  md5 '43ea5540f9e36f39823186119bef2f31'
  version '3.5.1'

  depends_on 'mcrypt-php'

  def install
    (share+'phpmyadmin').install Dir['*']
    quiet_system 'ln', '-s', (HOMEBREW_CELLAR+@name+"config.inc.php"), share+'phpmyadmin'
  end

  def caveats; <<-EOS.undent
    Note that this formula will NOT install mysql. It is not
    required since you might want to get connected to a remote
    database server.

    Webserver configuration example (add this at the end of
    your /etc/apache2/httpd.conf for instance) :
      Alias /phpmyadmin #{HOMEBREW_PREFIX}/share/phpmyadmin
      <Directory #{HOMEBREW_PREFIX}/share/phpmyadmin/>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        Allow from all
      </Directory>
    Then, open http://localhost/phpmyadmin

    More documentation : file://#{share}/phpmyadmin/Documentation.html
    EOS
  end
end