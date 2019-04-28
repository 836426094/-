select maturity,to_date(maturity,'yyyy-mm-dd'),to_char(to_date(maturity,'yyyy-mm-dd'),'YYYYmmdd'),length(to_char(to_date(maturity,'yyyy-mm-dd'),'YYYYmmdd'))  from O_LN_BUSINESS_DUEBILL
