___INFO___

{
  "displayName": "Legalweb Consent State",
  "description": "A variable template for Google Tag Manager that allows you to read the user consent state as selected in the Legalweb Cookie Consent banner.",
  "categories": [
    "PRIVACY",
    "TAG_MANAGEMENT"
  ],
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "MACRO",
  "version": 1,
  "containerContexts": [
    "WEB"
  ]
}

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

