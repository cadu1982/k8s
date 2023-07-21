def calcula_valor_acumulado(mensal, taxa_anual, imposto_renda, objetivo):
    valor_acumulado = 0
    meses = 0
    imposto_periodo = 0

    while valor_acumulado < objetivo:
        valor_acumulado += mensal
        imposto_periodo += (valor_acumulado - imposto_periodo) * (taxa_anual / 12) / 100

        if meses % 720 == 0:
            valor_acumulado -= imposto_periodo * (imposto_renda / 100)
            imposto_periodo = 0

        meses += 1

    return meses

mensal = 3000
taxa_anual = 13.65
imposto_renda = 15
objetivo = 100000

meses_para_alcancar_objetivo = calcula_valor_acumulado(mensal, taxa_anual, imposto_renda, objetivo)
anos = meses_para_alcancar_objetivo // 12
meses_resto = meses_para_alcancar_objetivo % 12

print(f"Levaria aproximadamente {anos} anos e {meses_resto} meses para alcançar 100.000 reais.")
