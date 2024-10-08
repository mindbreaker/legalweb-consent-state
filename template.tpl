___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Legalweb Consent State",
  "description": "A variable template for Google Tag Manager that allows you to read the user consent state as selected in the Legalweb.io Cookie Consent banner.",
   "categories": [
    "TAG_MANAGEMENT",
    "PERSONALIZATION",
    "UTILITY"
  ],
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const queryPermission = require('queryPermission');
const getCookieValues = require('getCookieValues');
const decode = require('decodeUriComponent');

const JSON = require('JSON');
const cookieName = 'legalweb_cookie_settings';
let integrations = '|';
let cookieValues;

if (queryPermission('get_cookies', cookieName)) {
  cookieValues = getCookieValues(cookieName);
  if (cookieValues && cookieValues.length > 0) {

      let settings = JSON.parse(decode(cookieValues[0]));
      if(settings && settings.integrations) {
        integrations += settings.integrations.join('|') + '|';
      }
  }
}
data.gtmOnSucces = true;
return integrations;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "cookieNames",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "legalweb_cookie_settings"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 6.12.2023, 18:41:16
