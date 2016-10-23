create or replace package testdata_ninja

as

  /** Main package of the testdata code. Generators are defined here.
  * @author Morten Egan
  * @version 0.0.1
  * @project TESTDATA_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  -- Globals
  g_default_generator_rows        number := 10;

  -- Records and types.
  -- People
  type person_rec is record (
    person_num_pk           number
    , person_char_pk        varchar2(50)
    , person_cdate          date
    , country_short         varchar2(10)
    , identification        varchar2(50)
    , first_name            varchar2(100)
    , middle_name           varchar2(100)
    , last_name             varchar2(100)
    , birthdate             date
    , gender                varchar2(20)
  );
  type person_tab is table of person_rec;
  -- Users
  type user_rec is record (
    user_num_pk             number
    , user_char_pk          varchar2(50)
    , user_cdate            date
    , username              varchar2(250)
    , email                 varchar2(250)
    , address1              varchar2(250)
    , address2              varchar2(250)
    , zipcode               varchar2(20)
    , state                 varchar2(50)
    , creditcard            varchar2(50)
    , creditcard_num        number
    , creditcard_expiry     varchar2(10)
  );
  type user_tab is table of user_rec;
  -- Mobile CDR
  type cdr_rec is record (
    cdr_num_pk              number
    , cdr_char_pk           varchar2(50)
    , cdr_cdate             date
    , orig_imsi             number
    , orig_isdn             number
    , orig_imei             varchar2(50)
    , call_type             varchar2(50)
    , call_type_service     varchar2(50)
    , call_start_latitude   number
    , call_start_longtitude number
    , call_date             timestamp
    , call_duration         number
    , dest_imsi             number
    , dest_isdn             number
    , dest_imei             varchar2(50)
    , network_operator      number
  );
  type cdr_tab is table of cdr_rec;
  -- News articles
  type news_article_rec is record (
    news_article_num_pk     number
    , news_article_char_pk  varchar2(50)
    , news_article_cdate    date
    , author                varchar2(300)
    , written               date
    , headline              varchar2(250)
    , lead_paragraph        varchar2(1000)
    , main_article          clob
    , end_paragraph         varchar2(1000)
  );
  type news_article_tab is table of news_article_rec;

  -- Generators
  /** People generator.
  * @author Morten Egan
  * @return person_tab The list of people generated.
  */
  function people (
    generator_count         number default g_default_generator_rows
  )
  return person_tab
  pipelined;

  /** User generator.
  * @author Morten Egan
  * @return user_tab The list of users generated.
  */
  function users (
    generator_count         number default g_default_generator_rows
  )
  return user_tab
  pipelined;

  /** CDR Generator.
  * @author Morten Egan
  * @return cdr_tab The list of CDR records.
  */
  function cdr (
    generator_count         number default g_default_generator_rows
  )
  return cdr_tab
  pipelined;

  /** News article generators.
  * @author Morten Egan
  * @return news_article_tab The list of of articles.
  */
  function articles (
    generator_count         number default g_default_generator_rows
  )
  return news_article_tab
  pipelined;

end testdata_ninja;
/
