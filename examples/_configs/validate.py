# -*- coding: utf-8 -*-
"""
    Validate
    --------

    AppConfig configuration semantic validation lambda function
    https://docs.aws.amazon.com/appconfig/latest/userguide/appconfig-creating-configuration-and-profile-validators.html

"""

import json
from typing import Dict
from base64 import b64decode

# Lambda function validators must be configured with the following event schema.
# AWS AppConfig uses this schema to invoke the Lambda function.
# The content is a base64-encoded string, and the URI is a string.
# {
#     "applicationId": "The application Id of the configuration profile being validated",
#     "configurationProfileId": "The configuration profile Id of the configuration profile being validated",
#     "configurationVersion": "The configuration version of the configuration profile being validated",
#     "content": "Base64EncodedByteString",
#     "uri": "The uri of the configuration"
# }


def handler(event: Dict, _c: Dict):
    """
    Lambda function to receive and validate configuration payload semantics.

    :param event: lambda expected event object
    :param _c: lambda expected context object (unused)
    :returns: none
    """
    # log out payload to CloudWatch
    print(json.dumps(event))

    base64_content = event.get('content')
    config_content = b64decode(base64_content).decode('ascii')

    print(json.dumps(json.loads(config_content)))

    # example to fail validation
    if False:
        raise Exception("This would fail validation if raised")
