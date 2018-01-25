%macro datechange(var);
year_update=substr(&var,1,4)*1;
month_update=substr(&var,6,2)*1;
day_update=substr(&var,9,2)*1;
hour_update=substr(&var,12,2)*1;
minut_update=substr(&var,15,2)*1;
sec_update=substr(&var,18,2)*1;
date_update=mdy(month_update,day_update,year_update);format date_update date10.;
&var._update=dhms(date_update,hour_update,minut_update,sec_update);
format &var._update datetime.;
%mend datechange;

%let path=/usr/sasmeta/Lev1/SASApp/DEPOSE_FIC_TEXTE/SHAREDATA/SIGNANDGO/output_sql_table_info;
