class DockerDns < Formula
  include Language::Python::Virtualenv
  include Language::Python::Shebang

  desc "Make docker containers addressable via DNS"
  homepage "https://gitlab.com/onlynone/docker-mac-dns"
  url "https://github.com/onlynone/docker-mac-dns/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "c6510e6f12b26ffcce5d3796bc1105c8fb31d8fa8b8053a58dcd50eee6162ec5"

  depends_on "chipmk/tap/docker-mac-net-connect"
  depends_on "python@3"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/71/da/e94e26401b62acd6d91df2b52954aceb7f561743aa5ccc32152886c76c96/certifi-2024.2.2.tar.gz"
    sha256 "0569859f95fc761b18b45ef421b1290a0f65f147e92a1e5eb3e635f9a5e4e66f"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/63/09/c1bc53dab74b1816a00d8d030de5bf98f724c52c1635e07681d312f20be8/charset-normalizer-3.3.2.tar.gz"
    sha256 "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5"
  end

  resource "dnslib" do
    url "https://files.pythonhosted.org/packages/84/09/fb783ca757344c240425c17ffcfca9a0fe54fec9fca2f52d74cd09e82b54/dnslib-0.9.24.tar.gz"
    sha256 "ef167868a30d4ce7c90b921279d7ecfb986be8ebc530f3e6050a2ecb68707c76"
  end

  resource "docker" do
    url "https://files.pythonhosted.org/packages/25/14/7d40f8f64ceca63c741ee5b5611ead4fb8d3bcaf3e6ab57d2ab0f01712bc/docker-7.0.0.tar.gz"
    sha256 "323736fb92cd9418fc5e7133bc953e11a9da04f4483f828b527db553f1e7e5a3"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/bf/3f/ea4b9117521a1e9c50344b909be7886dd00a519552724809bb1f486986c2/idna-3.6.tar.gz"
    sha256 "9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d12491ca"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/ee/b5/b43a27ac7472e1818c4bafd44430e69605baefe1f34440593e0332ec8b4d/packaging-24.0.tar.gz"
    sha256 "eb82c5e3e56209074766e6885bb04b8c38a0c015d0a30036ebe7ece34c9989e9"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/9d/be/10918a2eac4ae9f02f6cfe6414b7a155ccd8f7f9d4380d62fd5b955065c3/requests-2.31.0.tar.gz"
    sha256 "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd6ad1e1"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/7a/50/7fd50a27caa0652cd4caf224aa87741ea41d3265ad13f010886167cfcc79/urllib3-2.2.1.tar.gz"
    sha256 "d0570876c61ab9e520d776c38acbbb5b05a776d3f9ff98a5c8fd5162a444cf19"
  end

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources
    bin.install "hosts.py" => "docker-dns"
    rewrite_shebang python_shebang_rewrite_info(venv.root/"bin/python3"), bin/"docker-dns"
  end

  service do
    keep_alive true
    run opt_bin/"docker-dns"
    log_path var/"log/docker-dns/std_out.log"
    error_log_path var/"log/docker-dns/std_error.log"
  end

  test do
    assert_predicate bin/"docker-dns", :exist?
  end
end
