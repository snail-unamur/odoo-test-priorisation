#  COLLECTE DES 30 COMMITS  (logs de tests + diffs)
# >>> A EDITER : chemin du depot Odoo sur ta machine
$ODOO = "C:\Users\LEGION\OneDrive\Bureau\master_thesis\odoo"

# Dossier de sortie = data/final_data du package (relatif a ce script)
$OUT  = Join-Path $PSScriptRoot "..\data\final_data"
New-Item -ItemType Directory -Force -Path $OUT | Out-Null

$env:PGPASSWORD = "odoo"
cd $ODOO
$MODULES = "account,purchase,sale,stock,mrp,point_of_sale,website,website_sale,hr_holidays,hr_expense,project,calendar,mail,payment,im_livechat,sale_stock,purchase_stock,sale_mrp,stock_account,pos_sale,pos_loyalty,sale_timesheet,website_slides,crm,hr_attendance"


# commit01 — 00a07d87a03e  (2025-09-03)  ['account', 'purchase', 'sale']
git diff 00a07d87a03e^..00a07d87a03e > "$OUT\commit01_00a07d87_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 00a07d87a03e
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit01_00a07d87_tests.log"
dropdb -U odoo test_temp
git checkout 19.0

# commit02 — 2e99e132e318  (2026-01-22)  ['sale']
git diff 2e99e132e318^..2e99e132e318 > "$OUT\commit02_2e99e132_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 2e99e132e318
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit02_2e99e132_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit03 — 2ad3f3bc85f2  (2026-02-03)  ['point_of_sale']
git diff 2ad3f3bc85f2^..2ad3f3bc85f2 > "$OUT\commit03_2ad3f3bc_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 2ad3f3bc85f2
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit03_2ad3f3bc_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit04 — ae1836391b96  (2026-02-05)  ['mrp', 'sale_mrp']
git diff ae1836391b96^..ae1836391b96 > "$OUT\commit04_ae183639_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout ae1836391b96
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit04_ae183639_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit05 — 0f00c98b0e58  (2026-02-10)  ['account']
git diff 0f00c98b0e58^..0f00c98b0e58 > "$OUT\commit05_0f00c98b_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 0f00c98b0e58
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit05_0f00c98b_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit06 — 779aaf79c7e1  (2026-02-20)  ['purchase']
git diff 779aaf79c7e1^..779aaf79c7e1 > "$OUT\commit06_779aaf79_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 779aaf79c7e1
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit06_779aaf79_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit07 — ecb62ac0850a  (2026-02-24)  ['purchase_stock', 'mrp']
git diff ecb62ac0850a^..ecb62ac0850a > "$OUT\commit07_ecb62ac0_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout ecb62ac0850a
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit07_ecb62ac0_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit08 — 70361b3352e4  (2026-03-27)  ['sale_stock', 'stock_account']
git diff 70361b3352e4^..70361b3352e4 > "$OUT\commit08_70361b33_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 70361b3352e4
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit08_70361b33_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit09 — 10428c1ef573  (2026-03-05)  ['sale_purchase_stock', 'sale_stock']
git diff 10428c1ef573^..10428c1ef573 > "$OUT\commit09_10428c1e_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 10428c1ef573
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit09_10428c1e_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit10 — 967c24d9a59a  (2026-03-23)  ['mrp']
git diff 967c24d9a59a^..967c24d9a59a > "$OUT\commit10_967c24d9_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 967c24d9a59a
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit10_967c24d9_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit11 — f7f85f08f3a0  (2026-03-24)  ['sale']
git diff f7f85f08f3a0^..f7f85f08f3a0 > "$OUT\commit11_f7f85f08_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout f7f85f08f3a0
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit11_f7f85f08f3a0_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit12 — 8511114064b5  (2026-04-01)  ['stock']
git diff 8511114064b5^..8511114064b5 > "$OUT\commit12_85111140_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 8511114064b5
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit12_8511114064b5_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit13 — e8d4ea2dc711  (2026-04-01)  ['stock']
git diff e8d4ea2dc711^..e8d4ea2dc711 > "$OUT\commit13_e8d4ea2d_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout e8d4ea2dc711
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit13_e8d4ea2dc711_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit14 — 50e898d3abc5  (2026-03-24)  ['mrp']
git diff 50e898d3abc5^..50e898d3abc5 > "$OUT\commit14_50e898d3_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 50e898d3abc5
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit14_50e898d3abc5_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit15 — 3d850f26dcbe  (2026-04-28)  ['hr_holidays']
git diff 3d850f26dcbe^..3d850f26dcbe > "$OUT\commit15_3d850f26_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 3d850f26dcbe
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit15_3d850f26_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit16 — fbdac503b6a9  (2026-04-20)  ['account']
git diff fbdac503b6a9^..fbdac503b6a9 > "$OUT\commit16_fbdac503_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout fbdac503b6a9
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit16_fbdac503_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit17 — da82c1a69f5e  (2026-04-14)  ['purchase']
git diff da82c1a69f5e^..da82c1a69f5e > "$OUT\commit17_da82c1a6_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout da82c1a69f5e
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit17_da82c1a6_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit18 — 442cf8def562  (2026-04-22)  ['account']
git diff 442cf8def562^..442cf8def562 > "$OUT\commit18_442cf8de_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 442cf8def562
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit18_442cf8de_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit19 — 63d813f0ffa4  (2026-03-23)  ['point_of_sale']
git diff 63d813f0ffa4^..63d813f0ffa4 > "$OUT\commit19_63d813f0_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 63d813f0ffa4
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit19_63d813f0_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit20 — 348e6698e225  (2026-04-02)  ['stock']
git diff 348e6698e225^..348e6698e225 > "$OUT\commit20_348e6698_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 348e6698e225
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit20_348e6698_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit21 — ac72e930569f  (2026-04-28)  ['account']
git diff ac72e930569f^..ac72e930569f > "$OUT\commit21_ac72e930_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout ac72e930569f
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit21_ac72e930_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit22 — c3b9590fdfe5  (2026-04-28)  ['account']
git diff c3b9590fdfe5^..c3b9590fdfe5 > "$OUT\commit22_c3b9590f_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout c3b9590fdfe5
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit22_c3b9590f_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit23 — 5d58b75ff4ba  (2026-04-28)  ['stock']
git diff 5d58b75ff4ba^..5d58b75ff4ba > "$OUT\commit23_5d58b75f_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 5d58b75ff4ba
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit23_5d58b75f_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit24 — 03b8646d4b2d  (2026-04-28)  ['stock']
git diff 03b8646d4b2d^..03b8646d4b2d > "$OUT\commit24_03b8646d_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 03b8646d4b2d
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit24_03b8646d_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit25 — 5be6062d7899  (2026-04-28)  ['account']
git diff 5be6062d7899^..5be6062d7899 > "$OUT\commit25_5be6062d_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 5be6062d7899
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit25_5be6062d_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit26 — 6f42cf7f777d  (2026-04-28)  ['account']
git diff 6f42cf7f777d^..6f42cf7f777d > "$OUT\commit26_6f42cf7f_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 6f42cf7f777d
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit26_6f42cf7f_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit27 — eebe9b131a68  (2026-04-28)  ['point_of_sale']
git diff eebe9b131a68^..eebe9b131a68 > "$OUT\commit27_eebe9b13_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout eebe9b131a68
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit27_eebe9b13_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit28 — 4c855d81d20a  (2026-05-04)  ['stock']
git diff 4c855d81d20a^..4c855d81d20a > "$OUT\commit28_4c855d81_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 4c855d81d20a
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit28_4c855d81_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit29 — 7e324fa729b8  (2026-05-04)  ['hr_holidays']
git diff 7e324fa729b8^..7e324fa729b8 > "$OUT\commit29_7e324fa7_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 7e324fa729b8
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit29_7e324fa7_tests.log"
dropdb -U odoo test_temp
git checkout 19.0


# commit30 — 58fe6a8803de  (2026-05-04)  ['point_of_sale']
git diff 58fe6a8803de^..58fe6a8803de > "$OUT\commit30_58fe6a88_diff.txt"
dropdb -U odoo test_temp 2>$null
git checkout 58fe6a8803de
python odoo-bin -i $MODULES --test-enable --stop-after-init -d test_temp -r odoo -w odoo --log-level test 2>&1 | Tee-Object -FilePath "$OUT\commit30_58fe6a88_tests.log"
dropdb -U odoo test_temp
git checkout 19.0

