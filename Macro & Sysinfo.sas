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


data _null_;
		call symput("day",left(compress(put("&sysdate"d,yymmdd10.),"-"," ")));
		call symput("lastmonth",substr(compress(put(intnx('month',today(),-1),yymmdd10.),"-" ),1,6));
		call symput("last2months",substr(compress(put(intnx('month',today(),-2),yymmdd10.),"-" ),1,6));
        call symput ("thismonthbegdate", compress(put(intnx('month',today(),-0,'b'),yymmdd10.),"-" ));       
        call symput ("lastmonthenddate", compress(put(intnx('month',today(),-1,'e'),yymmdd10.),"-" ));
		call symput ("lastmonthbegdate", compress(put(intnx('month',today(),-1,'b'),yymmdd10.),"-" ));
		call symput("INITREFMONTH",substr(compress(put(intnx('month',today(),-4),yymmdd10.),"-" ),1,6));
run;
%put &day.;
%put &lastmonth.;
%put &last2months.;
%put &thismonthbegdate.;
%put &lastmonthenddate.;
%put &lastmonthbegdate.;
%put &INITREFMONTH.;



/*SAS SYSTEM INFORMATION*/
proc setinit;
run;