
#
function enterHmrcMode () {
  source activate hmrc

  export jenkins_user="pawel.panasewicz"
  export jenkins_key="d553a4af820021ee8f641e828e0e0013"
  export WORKSPACE="/home/pawel/Applications/hmrc-development-environment/hmrc"
  alias goto_workspace='cd ~/Applications/hmrc-development-environment/hmrc'
  export JAVA_HOME="/usr/lib/jvm/java-8-oracle"

  alias start_GFORM_DEP='sm --start FILE_UPLOAD -r 1.26.0 -fo && \
  sm --start FILE_UPLOAD_FRONTEND -r 1.14.0 -fo && \
  sm --start GFORM_DEP -fo && \
  sm -s'

  #the same as abouve but not offline. Call it first time
  alias start_GFORM_DEP0='sm --start FILE_UPLOAD -r 1.26.0 -f && \
  sm --start FILE_UPLOAD_FRONTEND -r 1.14.0 -f && \
  sm --start GFORM_DEP -f && \
  sm -s'


  alias start_SELF_SERVICE_TIME_TO_PAY_ALL0='sm --start SELF_SERVICE_TIME_TO_PAY_ALL -f && \
  sm -s'

  alias start_SELF_SERVICE_TIME_TO_PAY_ALL='sm --start SELF_SERVICE_TIME_TO_PAY_ALL -fo && \
  sm -s'

  alias stop_SELF_SERVICE_TIME_TO_PAY_ALL='sm --stop SELF_SERVICE_TIME_TO_PAY_ALL && \
  sm -s'

  SERVICES=(AUTH AUTH_LOGIN_APIUSER_DETAILS AUTH_LOGIN_STUB AUTH_LOGIN_API AUTHENTICATOR DATASTREAM BANK_ACCOUNT_REPUTATION CA_FRONTEND GG GG_STUBS USER_PROFILE USER_DETAILS DIRECT_DEBIT KEYSTORE TIME_TO_PAY_ELIGIBILITY TIME_TO_PAY_TAXPAYER SA_STUB USER_DETAILSKEYSTORE  SELF_SERVICE_TIME_TO_PAY SELF_SERVICE_TIME_TO_PAY_FRONTEND TIME_TO_PAY_ARRANGEMENT ASSETS_FRONTEND SELF_SERVICE_TIME_TO_PAY_DES_STUB_SCALA TIME_TO_PAY_CALCULATOR CAMPAIGN_MANAGERMULTI_FACTOR_AUTHENTICATIONTWO_STEP_VERIFICATION_RULE_ENGINEONE_TIME_PASSWORDGG_AUTHENTICATION TAR_FRONTEND)
  for M in $SERVICES
  do
    eval "alias sm_start_${M}='sm --start $M -f && sm -s'"
    eval "alias sm_stop_${M}='sm --stop $M && sm -s'"
    eval "alias sm_restart_${M}='sm --restart $M && sm -s'"
    eval "alias sm_logs_${M}='sm --logs $M'"
  done


}

function leaveHmrcMode () {
  sm --stop GFORM_DEP
  source deactivate

}

alias start_mongo='sudo service mongod start && sudo service mongod status'
alias cc='sbt clean test it:test'
alias robo3t='/dbox/bin/robo3t-1.1.1-linux-x86_64-c93c6b0/bin/robo3t > /dev/null 2>&1 &'
alias idea='/dbox/bin/idea-IU-172.3968.16/bin/idea.sh > /dev/null 2>&1 &'
