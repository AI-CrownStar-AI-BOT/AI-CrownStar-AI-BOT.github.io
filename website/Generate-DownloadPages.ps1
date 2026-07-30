<#
.SYNOPSIS
    Generate CrownStar download pages for v7.1.0 with SHA-256 checksums
.DESCRIPTION
    Creates download-*.html for all 8 tiers, linking to GitHub release assets
    and displaying SHA-256 checksums for integrity verification.
#>

$WebsiteDir = "D:\CrownStar-Absolute\crown-star-ai-bot\docs\website"
$ReleaseTag = "v7.1.0"
$ReleaseBase = "https://github.com/crownstar-ai/crown-star-ai-bot/releases/download/$ReleaseTag"

# Complete asset data with SHA-256 checksums from your release
$Tiers = @(
    @{
        id = "free"
        name = "免费版"
        price = "0"
        stripeId = ""
        qr = ""
        support = "社区支持"
        isFree = $true
        assets = @(
            @{ label = "Windows (EXE)"; icon = "⚙️"; file = "CrownStar-free-Win64.exe"; sha = "8d80bfca77acab9118afd4acd8161518a6df0a73daf0e3306b3a5aee49d0131d" }
            @{ label = "Windows (ZIP)"; icon = "📦"; file = "CrownStar-free-Win64.zip"; sha = "fd904cd50a7eaf673e24b5d1a05fe7a42adf02cd48f3c0b570abbef6a22b9f24" }
            @{ label = "Portable (ZIP)"; icon = "💼"; file = "CrownStar-free-Win64-Portable.zip"; sha = "80ab0a33cb94bc6d6582e0a15a0c87c0cc62430a173b009d8a1245009807b094" }
        )
    }
    @{
        id = "basic"
        name = "基础版"
        price = "39"
        stripeId = "buy_btn_1Tv0GpJ1ruuDi5YqZiWJR6mF"
        qr = "qr_5kQcN69HzarBd7w4imefC0a_basic.png"
        support = "邮件支持"
        isFree = $false
        assets = @(
            @{ label = "Windows (EXE)"; icon = "⚙️"; file = "CrownStar-basic-Win64.exe"; sha = "2b0c94fc5509e85bda69f6d29cf52944ba5b60c32e7cf4d3ed2e84823af92258" }
            @{ label = "Windows (ZIP)"; icon = "📦"; file = "CrownStar-basic-Win64.zip"; sha = "50f2bca103b750ff0cf29b9fa1a4268814760ea2333beaab63e77d9e99814b2b" }
            @{ label = "Portable (ZIP)"; icon = "💼"; file = "CrownStar-basic-Win64-Portable.zip"; sha = "822aac430499ee41180ed162ce98cd749225c7e47c60cba787ae508569bf8dfa" }
        )
    }
    @{
        id = "advanced"
        name = "进阶版"
        price = "248"
        stripeId = "buy_btn_1Tt7GIJ1ruuDi5YqArBtgvxH"
        qr = "qr_fZu28sbPH9nxffE9CGeF0b_advanced.png"
        support = "邮件+电话支持"
        isFree = $false
        assets = @(
            @{ label = "Windows (EXE)"; icon = "⚙️"; file = "CrownStar-advanced-Win64.exe"; sha = "e0197e0d4d773e2475722e404b2ed1a6dba39432f768bc4be3f0f1d378159761" }
            @{ label = "Windows (ZIP)"; icon = "📦"; file = "CrownStar-advanced-Win64.zip"; sha = "d827eb35a9c43cfca42f22b6965220b2fa6e7ebd16205e2d6a5c31972a3d8ab5" }
            @{ label = "Portable (ZIP)"; icon = "💼"; file = "CrownStar-advanced-Win64-Portable.zip"; sha = "c72d23bd741f845da6bd0eddce8560574f1d82d9ebafd14819e4bab671d28d76" }
        )
    }
    @{
        id = "professional"
        name = "专业版"
        price = "389"
        stripeId = "buy_btn_1Tt7KWJ1ruuDi5YqpRUOlsMU"
        qr = "qr_4gM14o4nf57hd7waGKefC0c_pro.png"
        support = "邮件+电话支持"
        isFree = $false
        assets = @(
            @{ label = "Windows (EXE)"; icon = "⚙️"; file = "CrownStar-professional-Win64.exe"; sha = "24287bb416dcac907ad6ca47988f32e8d96da74640e50311d0eb8ca849355a62" }
            @{ label = "Windows (ZIP)"; icon = "📦"; file = "CrownStar-professional-Win64.zip"; sha = "c060fc8da634bea6a45cf4c5fd4539a4893213ff599e8139918a45abbf585161" }
            @{ label = "Portable (ZIP)"; icon = "💼"; file = "CrownStar-professional-Win64-Portable.zip"; sha = "7928bfb394323a74f4720a5ff989bfd2b75c6d7fca85f70f6abadfd2b69c644a" }
        )
    }
    @{
        id = "org_small"
        name = "组织版-小型"
        price = "705"
        stripeId = "buy_btn_1Tt7PqJ1ruuDi5YqoL9o4AJz"
        qr = "qr_aFadRa4nf1V54B08yCefC0d_org_small.png"
        support = "优先电话支持"
        isFree = $false
        assets = @(
            @{ label = "Windows (EXE)"; icon = "⚙️"; file = "CrownStar-org_small-Win64.exe"; sha = "673df1deec5243b490b22087273888a21062d4099ecaf65de9d1407fd6de2573" }
            @{ label = "Windows (ZIP)"; icon = "📦"; file = "CrownStar-org_small-Win64.zip"; sha = "cd067fb4dc0c2345e18c15addad6ef0d523a32144e6919ff500aad1432c654ee" }
            @{ label = "Portable (ZIP)"; icon = "💼"; file = "CrownStar-org_small-Win64-Portable.zip"; sha = "fadd9e3daa4dd58684ed2ce96b68d9544f8eb3450886365bfd8678f5a4cadca5" }
        )
    }
    @{
        id = "org_medium"
        name = "组织版-中型"
        price = "61,775"
        stripeId = "buy_btn_1Tt7StJ1ruuDi5YqNibrAQG9"
        qr = "qr_8x2cN6g5X57hgjI5mqefC0e_org_medium.png"
        support = "优先电话支持"
        isFree = $false
        assets = @(
            @{ label = "Windows (EXE)"; icon = "⚙️"; file = "CrownStar-org_medium-Win64.exe"; sha = "921c35ce67ac948635e3812a4daeeeb84c566c9587b6bd9fe803f3d1ce423046" }
            @{ label = "Windows (ZIP)"; icon = "📦"; file = "CrownStar-org_medium-Win64.zip"; sha = "450ccbc7c9bf2506ffa593cba2c81a5d9d4d14da5a7351169305af73938a580f" }
            @{ label = "Portable (ZIP)"; icon = "💼"; file = "CrownStar-org_medium-Win64-Portable.zip"; sha = "49a384b754dbbabf4e5f72f11e5cb89b51452fd02155c568be32e80c08c2a10e" }
        )
    }
    @{
        id = "org_large"
        name = "组织版-大型"
        price = "476,000"
        stripeId = "buy_btn_1Tt7VXJ1ruuDi5YqkUijyCHE"
        qr = "qr_fZu4gA5rj2Z9gjIbKOefC0f_org_large.png"
        support = "优先电话支持"
        isFree = $false
        assets = @(
            @{ label = "Windows (EXE)"; icon = "⚙️"; file = "CrownStar-org_large-Win64.exe"; sha = "fb3c70234091fbbc524d972784f54faf705a504c5bd456d542ef209d2f777d39" }
            @{ label = "Windows (ZIP)"; icon = "📦"; file = "CrownStar-org_large-Win64.zip"; sha = "85ea8d1ef0f7354f3d6c3e95bca7ad9bf41324434a0237cca99b410b1df9b2f8" }
            @{ label = "Portable (ZIP)"; icon = "💼"; file = "CrownStar-org_large-Win64-Portable.zip"; sha = "88d6225cc58a2ced9118407a411629ca5704e67c6b663c95dab1ad7c1cb0007b" }
        )
    }
    @{
        id = "enterprise"
        name = "企业旗舰版"
        price = "1,675,000"
        stripeId = "buy_btn_1Tt7nyJ1ruuDi5YqMez5yz5A"
        qr = "qr_00w4gAaLD57h7Nc3eiefC0g_enterprise.png"
        support = "专属7×24支持"
        isFree = $false
        assets = @(
            @{ label = "Windows (EXE)"; icon = "⚙️"; file = "CrownStar-enterprise-Win64.exe"; sha = "a9975af12b47bf89fa87be648ca6d6a573465bf4ad49ed01ae5d1780e55589d0" }
            @{ label = "Windows (ZIP)"; icon = "📦"; file = "CrownStar-enterprise-Win64.zip"; sha = "4114a5151fbda3e06cb1c6189579ac2ef544f842097e9bd218008cd776011344" }
            @{ label = "Portable (ZIP)"; icon = "💼"; file = "CrownStar-enterprise-Win64-Portable.zip"; sha = "c1cf76f9173cb57f8b8e30414990fedcf9bd5df71671032f01233b2a7881ae54" }
        )
    }
)

# HTML template for each tier page
$Template = @'
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>下载 {name} · CrownStar v7.1.0</title>
    <style>
        * {{ margin:0; padding:0; box-sizing:border-box; }}
        body {{ font-family:'PingFang SC','Microsoft YaHei',sans-serif; background:#f5f7fb; color:#1a1a2e; line-height:1.8; }}
        .container {{ max-width:1280px; margin:0 auto; padding:0 2rem; }}
        .header {{ position:sticky; top:0; z-index:1000; background:rgba(255,255,255,0.85); backdrop-filter:blur(20px); border-bottom:1px solid rgba(255,255,255,0.4); padding:0.8rem 0; }}
        .header .container {{ display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:0.5rem; }}
        .logo {{ font-size:1.6rem; font-weight:700; color:#0a2e5c; text-decoration:none; }}
        .logo span {{ color:#c9a84c; }}
        .nav {{ display:flex; flex-wrap:wrap; gap:0.5rem 1.5rem; align-items:center; }}
        .nav a {{ color:#4a4a6a; font-weight:500; text-decoration:none; font-size:0.95rem; transition:color 0.3s; }}
        .nav a:hover {{ color:#0a2e5c; }}
        .nav .cta {{ background:#0a2e5c; color:#fff !important; padding:0.4rem 1.8rem; border-radius:3rem; font-weight:600; }}
        .nav .cta:hover {{ background:#1a4a7a; }}
        .nav .active {{ color:#0a2e5c; font-weight:600; border-bottom:2px solid #c9a84c; }}
        .page-hero {{ text-align:center; padding:2.5rem 0 1.5rem; }}
        .page-hero h1 {{ font-size:2.6rem; font-weight:800; color:#0a2e5c; }}
        .page-hero h1 .gold {{ color:#c9a84c; }}
        .page-hero .subtitle {{ font-size:1.1rem; color:#5a5a7a; max-width:700px; margin:0 auto; }}
        .back-link {{ display:inline-block; margin:0 0 1.5rem 0; color:#0a2e5c; font-weight:500; }}
        .back-link:hover {{ color:#c9a84c; }}
        .locked-notice {{ background:rgba(255,255,255,0.8); border:1px solid #c9a84c; border-radius:1.5rem; padding:2rem; text-align:center; margin:1.5rem 0; }}
        .locked-notice h2 {{ color:#0a2e5c; margin-bottom:0.5rem; }}
        .locked-notice .upgrade-note {{ font-size:0.85rem; color:#5a5a7a; margin:0.5rem 0 1rem; }}
        .payment-row {{ display:flex; flex-wrap:wrap; gap:1.5rem; justify-content:center; align-items:center; margin:1rem 0; }}
        .payment-row .stripe-container {{ flex:1; min-width:280px; }}
        .payment-row .qr-container {{ flex:0 0 auto; text-align:center; }}
        .payment-row .qr-container img {{ max-width:150px; border-radius:12px; border:1px solid #e8ecf0; }}
        .payment-row .qr-container .caption {{ font-size:0.75rem; color:#7a7a9a; margin-top:0.3rem; }}
        .payment-row .direct-link {{ display:inline-block; margin-top:0.5rem; padding:0.5rem 1.5rem; border-radius:2rem; background:#0a2e5c; color:#fff; text-decoration:none; font-weight:600; font-size:0.85rem; transition:background 0.2s; }}
        .payment-row .direct-link:hover {{ background:#1a4a7a; }}
        .asset-grid {{ display:grid; grid-template-columns:repeat(auto-fit,minmax(300px,1fr)); gap:1.5rem; margin:2rem 0; }}
        .asset-card {{ background:rgba(255,255,255,0.6); backdrop-filter:blur(20px); border:1px solid rgba(255,255,255,0.7); border-radius:1.2rem; padding:1.2rem 1.5rem; transition:transform 0.3s; display:flex; flex-direction:column; }}
        .asset-card:hover {{ transform:translateY(-4px); box-shadow:0 8px 30px rgba(0,0,0,0.08); border-color:#c9a84c; }}
        .asset-card .platform-icon {{ font-size:1.8rem; font-weight:700; }}
        .asset-card .filename {{ font-weight:600; font-size:0.95rem; color:#0a2e5c; word-break:break-all; margin:0.2rem 0; }}
        .asset-card .sha {{ font-size:0.6rem; color:#8a8aaa; word-break:break-all; font-family:'Courier New',monospace; background:#f0f2f5; padding:0.2rem 0.4rem; border-radius:4px; }}
        .asset-card .details {{ font-size:0.8rem; color:#7a7a9a; margin:0.2rem 0; }}
        .asset-card .size {{ font-size:0.75rem; color:#8a8aaa; }}
        .asset-card .btn-download {{ margin-top:0.6rem; padding:0.4rem 1.5rem; border-radius:2rem; background:#0a2e5c; color:#fff; font-weight:600; font-size:0.85rem; text-decoration:none; text-align:center; transition:0.2s; }}
        .asset-card .btn-download:hover {{ background:#1a4a7a; transform:scale(1.02); }}
        .asset-card .btn-locked {{ margin-top:0.6rem; padding:0.4rem 1.5rem; border-radius:2rem; background:#d0d8e0; color:#7a7a9a; font-weight:600; font-size:0.85rem; cursor:not-allowed; text-align:center; }}
        .asset-card .badge-locked {{ font-size:0.55rem; font-weight:600; text-transform:uppercase; padding:0.05rem 0.6rem; border-radius:12px; background:#fff3e0; color:#e65100; margin-top:0.2rem; display:inline-block; }}
        .asset-card .badge-free {{ font-size:0.55rem; font-weight:600; text-transform:uppercase; padding:0.05rem 0.6rem; border-radius:12px; background:#e8f5e9; color:#2e7d32; margin-top:0.2rem; display:inline-block; }}
        .asset-card .sha-label {{ font-size:0.6rem; color:#7a7a9a; margin-top:0.2rem; }}
        .footer {{ text-align:center; padding:2rem 0; color:#7a7a9a; border-top:1px solid rgba(0,0,0,0.04); font-size:0.9rem; }}
        .footer a {{ color:#0a2e5c; font-weight:500; }}
        .footer a:hover {{ color:#c9a84c; }}
        .version-badge {{ display:inline-block; background:#c9a84c; color:#0a2e5c; padding:0.1rem 1rem; border-radius:20px; font-size:0.7rem; font-weight:600; margin-left:0.5rem; }}
        @media (max-width:768px) {{ .nav a {{ font-size:0.85rem; }} .nav .cta {{ padding:0.4rem 1rem; font-size:0.8rem; }} .asset-grid {{ grid-template-columns:1fr; }} .payment-row {{ flex-direction:column; }} }}
    </style>
</head>
<body>
    <header class="header">
        <div class="container">
            <a href="index.html" class="logo">Crown<span>Star</span></a>
            <nav class="nav">
                <a href="index.html">首页</a>
                <a href="product.html">产品</a>
                <a href="pricing.html">定价</a>
                <a href="case-studies.html">案例</a>
                <a href="security.html">安全</a>
                <a href="download-free.html">免费下载</a>
                <a href="downloads.html" class="active">下载中心</a>
                <a href="swagger.html" target="_blank">API</a>
                <a href="articles.html">文章库</a>
                <a href="ai-groups.html" class="cta" style="background:#c9a84c; color:#0a2e5c !important;">AI-Groups</a>
                <a href="contact.html" class="cta">联系我们</a>
            </nav>
        </div>
    </header>

    <div class="container">
        <div style="padding-top:1.5rem;">
            <a href="downloads.html" class="back-link">← 返回下载中心</a>
        </div>

        <section class="page-hero">
            <h1>📥 <span class="gold">{name}</span> 下载</h1>
            <p class="subtitle">
                CrownStar v7.1.0 — 企业级主权AI平台
                <span class="version-badge">v7.1.0</span>
            </p>
            {pricing_note}
        </section>

        {payment_section}

        <div class="asset-grid">
            {asset_cards}
        </div>

        <div style="margin:2rem auto; padding:1rem 1.5rem; background:#fef9e7; border-left:4px solid #f0ad4e; border-radius:8px; font-size:0.85rem; color:#856404; max-width:800px;">
            <strong>📌 SHA-256 校验说明</strong><br>
            每个下载文件旁边都提供了 SHA-256 校验和。下载后，您可以使用以下命令验证文件完整性：<br>
            <code style="background:#f0f0f0; padding:0.2rem 0.5rem; border-radius:4px; display:inline-block; margin-top:0.3rem;">certutil -hashfile 文件名.exe SHA256</code>
            <span style="display:inline-block; margin:0 0.5rem;">或</span>
            <code style="background:#f0f0f0; padding:0.2rem 0.5rem; border-radius:4px; display:inline-block; margin-top:0.3rem;">Get-FileHash 文件名.exe -Algorithm SHA256</code>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <p>© 2026 CrownStar. All rights reserved. <a href="mailto:st3vens.ben@yandex.com">st3vens.ben@yandex.com</a></p>
        </div>
    </footer>
</body>
</html>
'@

# Helper function to format file size
function Get-FileSize {
    param($bytes)
    if ($bytes -ge 1GB) { return "{0:N1} GB" -f ($bytes / 1GB) }
    if ($bytes -ge 1MB) { return "{0:N0} MB" -f ($bytes / 1MB) }
    return "{0:N0} KB" -f ($bytes / 1KB)
}

# Generate each tier page
foreach ($tier in $Tiers) {
    $content = $Template

    # Replace basic fields
    $content = $content -replace '{name}', $tier.name

    # Pricing note
    if ($tier.isFree) {
        $pricingNote = '<p style="color:#2e7d32; font-weight:600;">💰 永久免费 · 无需购买</p>'
    } else {
        $pricingNote = '<p style="color:#c0392b; font-weight:600;">💰 价格: ¥{price} · 一次购买，终身免费升级</p>' -replace '{price}', $tier.price
    }
    $content = $content -replace '{pricing_note}', $pricingNote

    # Payment section
    if ($tier.isFree) {
        $paymentSection = ''
    } else {
        $paymentSection = @'
        <div class="locked-notice">
            <h2>🔒 购买 {name}</h2>
            <p class="upgrade-note">一次性购买 ¥{price}，终身免费升级。支付完成后您将通过邮件收到所有安装包和许可证密钥。</p>
            <div class="payment-row">
                <div class="stripe-container">
                    <script async src="https://js.stripe.com/v3/buy-button.js"></script>
                    <stripe-buy-button
                        buy-button-id="{stripeId}"
                        publishable-key="pk_live_51Tfj4kJ1ruuDi5YqOIzlE161ry0CZm8psePd0dMUN3z2BQ0RsKJVKq0s0TMVSowXVTaFE6kCvwpZ4n21VDi2FLsR00MlVGLppG"
                    >
                    </stripe-buy-button>
                </div>
                <div class="qr-container">
                    <img src="images/{qr}" alt="微信支付二维码" />
                    <div class="caption">扫码支付 (微信)</div>
                </div>
            </div>
            <p style="margin-top:0.5rem; font-size:0.8rem; color:#7a7a9a;">
                💡 支付完成后，下载按钮将自动解锁。您也将收到邮件确认。
            </p>
        </div>
'@ -replace '{name}', $tier.name `
           -replace '{price}', $tier.price `
           -replace '{stripeId}', $tier.stripeId `
           -replace '{qr}', $tier.qr
    }
    $content = $content -replace '{payment_section}', $paymentSection

    # Asset cards
    $assetCards = ''
    foreach ($asset in $tier.assets) {
        $downloadUrl = "$ReleaseBase/$($asset.file)"
        $isLocked = -not $tier.isFree
        $badge = if ($tier.isFree) {
            '<span class="badge-free">✅ 免费</span>'
        } else {
            '<span class="badge-locked">🔒 需要购买</span>'
        }
        $btn = if ($tier.isFree) {
            '<a href="{url}" class="btn-download" target="_blank">⬇️ 立即下载</a>' -replace '{url}', $downloadUrl
        } else {
            '<span class="btn-locked">🔒 购买后解锁</span>'
        }
        $assetCards += @'
        <div class="asset-card">
            <div class="platform-icon">{icon}</div>
            <div class="filename">{file}</div>
            <div class="sha-label">SHA-256:</div>
            <div class="sha">{sha}</div>
            <div class="details">Windows x64</div>
            <div>{badge}</div>
            {btn}
        </div>
'@ -replace '{icon}', $asset.icon `
           -replace '{file}', $asset.file `
           -replace '{sha}', $asset.sha `
           -replace '{badge}', $badge `
           -replace '{btn}', $btn
    }
    $content = $content -replace '{asset_cards}', $assetCards

    # Write the file
    $outFile = Join-Path $WebsiteDir "download-$($tier.id).html"
    $content | Out-File $outFile -Encoding utf8 -Force
    Write-Host "✅ Generated: $outFile" -ForegroundColor Green
}

Write-Host "`n🎉 All 8 download pages generated successfully!" -ForegroundColor Cyan
Write-Host "📁 Location: $WebsiteDir" -ForegroundColor Yellow
Write-Host "🔗 Each page links to: $ReleaseBase" -ForegroundColor Gray