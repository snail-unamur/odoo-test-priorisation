#  INJECTION DES 4 MUTATIONS  (controlled fault injection)

$ODOO = "C:\Users\LEGION\OneDrive\Bureau\master_thesis\odoo"

$OUT  = Join-Path $PSScriptRoot "..\data\mutations"
New-Item -ItemType Directory -Force -Path $OUT | Out-Null
$env:PGPASSWORD = "odoo"
cd $ODOO
git checkout 19.0
$MODULES = "account,purchase,sale,stock,mrp,point_of_sale,website,website_sale,hr_holidays,hr_expense,project,calendar,mail,payment,im_livechat,sale_stock,purchase_stock,sale_mrp,stock_account,pos_sale,pos_loyalty,sale_timesheet,website_slides,crm,hr_attendance"


# MUTATION1  (account)  ->  addons/account/models/account_move.py
$f = "addons/account/models/account_move.py"
$orig = Get-Content $f -Raw
$mut  = $orig.Replace("move.amount_untaxed = sign * total_untaxed_currency", "move.amount_untaxed = sign * total_untaxed_currency * 1.1")
if ($mut -eq $orig) { Write-Host "  ATTENTION: ligne non trouvee, ajuster le motif pour MUTATION1" -ForegroundColor Yellow }
Set-Content $f -Value $mut -NoNewline
dropdb -U odoo test_temp 2>$null
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\MUTATION1.log"
dropdb -U odoo test_temp
git checkout -- $f
Write-Host "MUTATION1 termine, fichier restaure." -ForegroundColor Green


# MUTATION2_stock  (stock)  ->  addons/stock/models/stock_move.py
$f = "addons/stock/models/stock_move.py"
$orig = Get-Content $f -Raw
$mut  = $orig.Replace("move.product_id.uom_id, rounding_method='HALF-UP')", "move.product_id.uom_id, rounding_method='HALF-UP') * 2")
if ($mut -eq $orig) { Write-Host "  ATTENTION: ligne non trouvee, ajuster le motif pour MUTATION2_stock" -ForegroundColor Yellow }
Set-Content $f -Value $mut -NoNewline
dropdb -U odoo test_temp 2>$null
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\MUTATION2_stock.log"
dropdb -U odoo test_temp
git checkout -- $f
Write-Host "MUTATION2_stock termine, fichier restaure." -ForegroundColor Green


# MUTATION3_sale  (sale)  ->  addons/sale/models/sale_order_line.py
$f = "addons/sale/models/sale_order_line.py"
$orig = Get-Content $f -Raw
$mut  = $orig.Replace("line.price_subtotal = base_line['tax_details']['total_excluded_currency']", "line.price_subtotal = base_line['tax_details']['total_excluded_currency'] * 0.8")
if ($mut -eq $orig) { Write-Host "  ATTENTION: ligne non trouvee, ajuster le motif pour MUTATION3_sale" -ForegroundColor Yellow }
Set-Content $f -Value $mut -NoNewline
dropdb -U odoo test_temp 2>$null
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\MUTATION3_sale.log"
dropdb -U odoo test_temp
git checkout -- $f
Write-Host "MUTATION3_sale termine, fichier restaure." -ForegroundColor Green


# MUTATION4_purchase  (purchase)  ->  addons/purchase/models/purchase_order_line.py
$f = "addons/purchase/models/purchase_order_line.py"
$orig = Get-Content $f -Raw
$mut  = $orig.Replace("line.price_subtotal = base_line['tax_details']['total_excluded_currency']", "line.price_subtotal = base_line['tax_details']['total_excluded_currency'] * 0.9")
if ($mut -eq $orig) { Write-Host "  ATTENTION: ligne non trouvee, ajuster le motif pour MUTATION4_purchase" -ForegroundColor Yellow }
Set-Content $f -Value $mut -NoNewline
dropdb -U odoo test_temp 2>$null
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\MUTATION4_purchase.log"
dropdb -U odoo test_temp
git checkout -- $f
Write-Host "MUTATION4_purchase termine, fichier restaure." -ForegroundColor Green
