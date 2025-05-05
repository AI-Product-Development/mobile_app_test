TITLE: Installing Docker and Docker Compose on Ubuntu
DESCRIPTION: This snippet shows how to install Docker and Docker Compose on an Ubuntu system. It removes any existing incompatible versions, installs prerequisites, sets up the Docker repository, and installs the latest versions of Docker and Docker Compose.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/hosting/installation/server-setups/docker-compose.md#2025-04-22_snippet_0

LANGUAGE: bash
CODE:
```
# Remove incompatible or out of date Docker implementations if they exist
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Install prereq packages
sudo apt-get update
sudo apt-get install ca-certificates curl
# Download the repo signing key
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Configure the repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update and install Docker and Docker Compose
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

----------------------------------------

TITLE: Calculating Order Totals with n8n Code Node in JavaScript
DESCRIPTION: This JavaScript snippet is designed for the n8n Code node configured in 'Run Once for All Items' mode. It retrieves all input items using `$input.all()`, calculates the total number of items (orders), and sums the 'orderPrice' property found within the 'json' object of each item. The final results are returned in the required n8n data structure.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/courses/level-one/chapter-5/chapter-5.5.md#2025-04-22_snippet_1

LANGUAGE: javascript
CODE:
```
let items = $input.all();
let totalBooked = items.length;
let bookedSum = 0;

for (let i=0; i < items.length; i++) {
  bookedSum = bookedSum + items[i].json.orderPrice;
}

return [{ json: {totalBooked, bookedSum} }];
```

----------------------------------------

TITLE: Accessing Node Output in n8n Workflows - JavaScript
DESCRIPTION: These code snippets demonstrate how to access the output data of other nodes in an n8n workflow using JavaScript, specifically within the Code node. The provided methods include retrieving all, first, or last output items, accessing node query parameters and context, and tracing linked items. These methods work natively in the Code node unless otherwise noted, and require specifying the relevant node name as a string argument. Limitations include some methods (such as .item) not being available within the Code node context.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/code/builtin/output-other-nodes.md#2025-04-22_snippet_0

LANGUAGE: JavaScript
CODE:
```
// Returns all items from a given node
$("<node-name>").all(branchIndex?, runIndex?)

```

LANGUAGE: JavaScript
CODE:
```
// The first item output by the given node
$("<node-name>").first(branchIndex?, runIndex?)

```

LANGUAGE: JavaScript
CODE:
```
// The last item output by the given node
$("<node-name>").last(branchIndex?, runIndex?)

```

LANGUAGE: JavaScript
CODE:
```
// The linked item (not available in Code node)
$("<node-name>").item

```

LANGUAGE: JavaScript
CODE:
```
// Object containing the query settings of the given node
$("<node-name>").params

```

LANGUAGE: JavaScript
CODE:
```
// Boolean. Node execution context (only
// available in Loop Over Items node)
$("<node-name>").context

```

LANGUAGE: JavaScript
CODE:
```
// Item tracing for linked input (use instead of .item in Code node)
$("<node-name>").itemMatching(currentNodeInputIndex)

```

----------------------------------------

TITLE: Restoring Email Using itemMatching in n8n Code Node (JavaScript)
DESCRIPTION: This JavaScript code runs within an n8n Code node. It iterates through all input items (`$input.all()`). For each item at index `i`, it uses `$('Customer Datastore (n8n training)').itemMatching(i)` to access the corresponding item from the 'Customer Datastore (n8n training)' node and retrieves its `email` property. This email is then assigned to the `restoreEmail` property of the current item's JSON data. Finally, it returns the modified array of items.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/code/cookbook/builtin/itemmatching.md#2025-04-22_snippet_3

LANGUAGE: js
CODE:
```
for(let i=0; i<$input.all().length; i++) {
  		$input.all()[i].json.restoreEmail = $('Customer Datastore (n8n training)').itemMatching(i).json.email;
	}
	return $input.all();
```

----------------------------------------

TITLE: Defining an Array of Objects in JavaScript
DESCRIPTION: This JavaScript snippet defines a variable `turtles` as an array containing four objects, each representing a turtle with 'name' and 'color' properties. It demonstrates the structure of an array holding multiple object elements, a common pattern in n8n data.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/courses/level-two/chapter-1.md#2025-04-22_snippet_1

LANGUAGE: javascript
CODE:
```
```javascript
var turtles = [
	{
		name: 'Michelangelo',
		color: 'orange',
	},
	{
		name: 'Donatello',
		color: 'purple',
	},
	{
		name: 'Raphael',
		color: 'red',
	},
	{
		name: 'Leonardo',
		color: 'blue',
	}
];
```
```

----------------------------------------

TITLE: Splitting Specific Array Field within Item via n8n Code Node in JavaScript
DESCRIPTION: This JavaScript snippet illustrates how to transform data within a specific field of an incoming item using the n8n Code node. It accesses all input items, targets the `workEmail` field of the first item (assuming it's an array), and uses `.map()` to create a new output item for each element in that array, wrapping it in the standard `{ json: item }` structure.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/courses/level-two/chapter-1.md#2025-04-22_snippet_7

LANGUAGE: javascript
CODE:
```
```javascript
let items = $input.all();
return items[0].json.workEmail.map(item => {
	return {
		json: item
	}
});
```
```

----------------------------------------

TITLE: Defining Node Class Structure in TypeScript
DESCRIPTION: This TypeScript snippet defines the main class `NasaPics` which implements the `INodeType` interface. It includes the required `description` property of type `INodeTypeDescription`, where the node's configuration, properties, and operations will be defined.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/integrations/creating-nodes/build/declarative-style-node.md#2025-04-22_snippet_3

LANGUAGE: typescript
CODE:
```
export class NasaPics implements INodeType {
	description: INodeTypeDescription = {
		// Basic node details will go here
		properties: [
		// Resources and operations will go here
		]
	};
}
```

----------------------------------------

TITLE: Creating Message Expression in n8n
DESCRIPTION: Expression used in Customer Messenger node to create a personalized message using customer name and description variables from the workflow data.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/try-it-out/quickstart.md#2025-04-22_snippet_0

LANGUAGE: javascript
CODE:
```
Hi {{ $json.customer_name }}. Your description is: {{ $json.customer_description }}
```

----------------------------------------

TITLE: Extracting Properties from Current Node's Input in n8n
DESCRIPTION: This expression extracts the name property from the current node's input item. While drag-and-drop data mapping is typically used for this purpose, this expression provides an alternative method.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/data/data-mapping/data-mapping-expressions.md#2025-04-22_snippet_4

LANGUAGE: js
CODE:
```
{{$input.item.json.name}}
```

----------------------------------------

TITLE: Logging a Variable to Console using console.log in JavaScript (n8n Code Node)
DESCRIPTION: Demonstrates the basic usage of `console.log()` within an n8n Code node (set to JavaScript) to print the value of a variable (`a`) to the browser's developer console. This is useful for inspecting variable values during workflow execution for debugging.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/code/cookbook/code-node/console-log.md#2025-04-22_snippet_0

LANGUAGE: js
CODE:
```
let a = "apple";
console.log(a);
```

----------------------------------------

TITLE: Updating n8n via Docker Compose
DESCRIPTION: Shell commands for updating n8n when running in Docker Compose. The process involves pulling the latest image version, stopping the current containers, and starting them again with the updated version.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/_snippets/self-hosting/installation/docker-compose-updating.md#2025-04-22_snippet_0

LANGUAGE: sh
CODE:
```
# Pull latest version
docker compose pull

# Stop and remove older version
docker compose down

# Start the container
docker compose up -d
```

----------------------------------------

TITLE: Accessing Webhook Body Data with an n8n Expression (JavaScript)
DESCRIPTION: Demonstrates a basic n8n expression using the built-in `$json` variable and JMESPath dot notation to extract the `city` value from the `body` object of the incoming JSON data shown previously. It notes that bracket notation (`$json['body']['city']`) is also a valid alternative.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/code/expressions.md#2025-04-22_snippet_1

LANGUAGE: js
CODE:
```
{{$json.body.city}}
```

----------------------------------------

TITLE: Defining n8n Data Structure in JSON
DESCRIPTION: This snippet demonstrates the standard structure for data passed between nodes in n8n. It shows how regular data is wrapped in a 'json' key and binary data in a 'binary' key, both within an array of objects. The example includes details for handling file metadata in binary data.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/data/data-structure.md#2025-04-22_snippet_0

LANGUAGE: json
CODE:
```
[
	{
		// For most data:
		// Wrap each item in another object, with the key 'json'
		"json": {
			// Example data
			"apple": "beets",
			"carrot": {
				"dill": 1
			}
		},
		// For binary data:
		// Wrap each item in another object, with the key 'binary'
		"binary": {
			// Example data
			"apple-picture": {
				"data": "....", // Base64 encoded binary data (required)
				"mimeType": "image/png", // Best practice to set if possible (optional)
				"fileExtension": "png", // Best practice to set if possible (optional)
				"fileName": "example.png", // Best practice to set if possible (optional)
			}
		}
	},
]
```

----------------------------------------

TITLE: Using HTTP Request Helper Methods in n8n Node Builder - TypeScript
DESCRIPTION: Demonstrates how to use n8n's HTTP request helpers within the execute function of a custom node when making API calls, including both unauthenticated and authenticated scenarios. Requires that the node is defined in the programmatic style and n8n's helper methods are available via the this context. The 'options' object contains request details and supports various HTTP parameters for robust integration. Input is the 'options' object (with at least 'url'), and output is the API response object (either body or full response depending on flags).
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/integrations/creating-nodes/build/reference/http-helpers.md#2025-04-22_snippet_0

LANGUAGE: TypeScript
CODE:
```
// If no auth needed
const response = await this.helpers.httpRequest(options);

// If auth needed
const response = await this.helpers.httpRequestWithAuthentication.call(
	this, 
	'credentialTypeName', // For example: pipedriveApi
	options,
);
```

----------------------------------------

TITLE: Returning Data Structure from n8n Code Node in JavaScript
DESCRIPTION: This snippet illustrates the fundamental structure required when returning data from an n8n Code node. It shows an array containing a single item, where the actual data (`{ apple: 'beets' }`) is nested within a `json` key, conforming to n8n's expected item format.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/courses/level-two/chapter-1.md#2025-04-22_snippet_2

LANGUAGE: javascript
CODE:
```
```javascript
return [
	{
		json: {
			apple: 'beets',
		}
	}
];
```
```

----------------------------------------

TITLE: Retrieving Full or Single Custom Data - n8n Code Node (JavaScript)
DESCRIPTION: Demonstrates two approaches: retrieving the complete custom data dictionary or accessing the value for a specific key during workflow execution in JavaScript. Uses $execution.customData.getAll() to fetch all key-value pairs or $execution.customData.get(key) for a specific item. These calls are available within the Code node context, and returned values will match prior set values (strings), or null/undefined if nonexistent.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/workflows/executions/custom-executions-data.md#2025-04-22_snippet_4

LANGUAGE: JavaScript
CODE:
```
// Access the current state of the object during the execution
const customData = $execution.customData.getAll();

// Access a specific value set during this execution
const customData = $execution.customData.get("key");
```

----------------------------------------

TITLE: Configuring package.json for n8n Community Node
DESCRIPTION: Example of how to structure the package.json file for an n8n community node, including the required 'n8n' attribute for specifying nodes and credentials.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/_snippets/integrations/submit-community-node.md#2025-04-22_snippet_0

LANGUAGE: json
CODE:
```
{
  "name": "n8n-nodes-example",
  "version": "1.0.0",
  "description": "An example n8n community node",
  "keywords": ["n8n-community-node-package"],
  "n8n": {
    "nodes": ["nodes/ExampleNode.node.ts"],
    "credentials": ["credentials/ExampleCredentials.credentials.ts"]
  }
}
```

----------------------------------------

TITLE: Accessing Custom Variables in n8n Expressions/Code
DESCRIPTION: Demonstrates the syntax for accessing a pre-defined custom variable within n8n expressions or the Code node. Use the global `$vars` object followed by a dot and the specific variable key (name) you defined in the UI. All variable values are treated as strings during workflow execution. If a variable key doesn't exist or has no value, it resolves to `undefined`.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/code/variables.md#2025-04-22_snippet_0

LANGUAGE: javascript
CODE:
```
// Access a variable
$vars.<variable-name>
```

----------------------------------------

TITLE: Security Environment Variables Table in Markdown
DESCRIPTION: Markdown table defining security-related environment variables for n8n, including their types, default values, and descriptions. Covers file access restrictions, workflow monitoring, and cookie security configurations.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/hosting/configuration/environment-variables/security.md#2025-04-22_snippet_0

LANGUAGE: markdown
CODE:
```
| Variable | Type  | Default  | Description |
| :------- | :---- | :------- | :---------- |
| `N8N_BLOCK_ENV_ACCESS_IN_NODE` | Boolean | `false` | Whether to allow users to access environment variables in expressions and the Code node (false) or not (true). |
| `N8N_RESTRICT_FILE_ACCESS_TO` | String |  | Limits access to files in these directories. Provide multiple files as a colon-separated list (":`"). |
| `N8N_BLOCK_FILE_ACCESS_TO_N8N_FILES` | Boolean | `true` | Set to `true` to block access to all files in the `.n8n` directory and user defined configuration files. |
| `N8N_SECURITY_AUDIT_DAYS_ABANDONED_WORKFLOW` | Number | 90 | Number of days to consider a workflow abandoned if it's not executed. |
| `N8N_SECURE_COOKIE` | Boolean | `true` | Ensures that cookies are only sent over HTTPS, enhancing security.|
| `N8N_SAMESITE_COOKIE` | Enum string: `strict`, `lax`, `none` | `lax` | Controls cross-site cookie behavior ([learn more](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie/SameSite)):<ul><li>`strict`: Sent only for first-party requests.</li><li>`lax` (default): Sent with top-level navigation requests.</li><li>`none`: Sent in all contexts (requires HTTPS).</li></ul> |
```

----------------------------------------

TITLE: Incrementing Page Number Body Parameter in n8n HTTP Request (JavaScript)
DESCRIPTION: This JavaScript expression illustrates setting a body parameter (e.g., 'page') for pagination in n8n HTTP Request POST requests. Similar to query parameter pagination, it increments the page number using the built-in `$pageCount` variable (starting at 0) plus 1. This configuration is applied in the 'Value' field (with Expression toggled on) when 'Pagination Mode' is 'Update a Parameter in Each Request', 'Type' is 'Body', and the request method is typically POST. The specific body parameter name ('page' in this example) depends on the target API.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/code/cookbook/http-node/pagination.md#2025-04-22_snippet_2

LANGUAGE: javascript
CODE:
```
{{ $pageCount + 1 }}
```

----------------------------------------

TITLE: Constructing Dynamic Message for Discord Node using n8n Expressions
DESCRIPTION: This n8n expression defines the content of a message to be sent via the Discord node. It dynamically incorporates the total number of booked orders (`$json["totalBooked"]`), the total value (`$json["bookedSum"]`) from the preceding node's JSON output, and a unique ID extracted from the header parameters of an 'HTTP Request' node (`$('HTTP Request').params["headerParameters"]["parameters"][0]["value"]`). This expression should be entered into the 'Message' field's Expression tab within the Discord node configuration.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/courses/level-one/chapter-5/chapter-5.6.md#2025-04-22_snippet_0

LANGUAGE: n8n expression
CODE:
```
This week we've {{$json["totalBooked"]}} booked orders with a total value of {{$json["bookedSum"]}}. My Unique ID: {{ $('HTTP Request').params["headerParameters"]["parameters"][0]["value"] }}
```

----------------------------------------

TITLE: Managing Custom Execution Data in n8n JavaScript
DESCRIPTION: Allows setting and getting custom data associated with the current execution. Refer to [Custom executions data](/workflows/executions/custom-executions-data.md) for details. This metadata property is available for use within the Code node.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/code/builtin/n8n-metadata.md#2025-04-22_snippet_1

LANGUAGE: javascript
CODE:
```
$execution.customData
```

----------------------------------------

TITLE: Returning Array of Items in Code Node (JavaScript)
DESCRIPTION: This snippet demonstrates the correct structure required when returning data from an n8n Code node. Data must be returned as an array of objects, each with a 'json' property containing an object. This format is necessary for downstream nodes to process the data correctly. There are no external dependencies, but the shape of the 'json' object should match your workflow requirements.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/integrations/builtin/core-nodes/n8n-nodes-base.code/common-issues.md#2025-04-22_snippet_0

LANGUAGE: javascript
CODE:
```
[
  {
    "json": {
	  // your data goes here
	}
  }
]
```

----------------------------------------

TITLE: Running n8n with npx in Bash
DESCRIPTION: This command uses npx to run n8n without installing it, downloading all necessary components to start n8n.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/hosting/installation/npm.md#2025-04-22_snippet_0

LANGUAGE: bash
CODE:
```
npx n8n
```

----------------------------------------

TITLE: Accessing Data from Items Retrieved with .all() in TypeScript (n8n)
DESCRIPTION: Shows how to iterate through the array of items returned by `$('<node-name>').all()` in n8n TypeScript/JavaScript expressions. It accesses the JSON data payload of each item using the `.json` property and logs it to the console. This pattern is common for processing results from previous nodes.
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/code/cookbook/builtin/all.md#2025-04-22_snippet_2

LANGUAGE: typescript
CODE:
```
previousNodeData = $("<node-name>").all();
for(let i=0; i<previousNodeData.length; i++) {
	console.log(previousNodeData[i].json);
}
```

----------------------------------------

TITLE: Docker Compose Environment Variables
DESCRIPTION: Example of setting environment variables in docker-compose.yaml file
SOURCE: https://github.com/n8n-io/n8n-docs/blob/main/docs/hosting/configuration/configuration-methods.md#2025-04-22_snippet_5

LANGUAGE: yaml
CODE:
```
n8n:
    environment:
      - N8N_TEMPLATES_ENABLED=false
