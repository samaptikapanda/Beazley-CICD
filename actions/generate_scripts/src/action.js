const core = require("@actions/core");
const github = require("@actions/github");
const fetch = require("node-fetch");

async function run() {
  let USER_NAME = core.getInput("USER_NAME");
  let P_W = core.getInput("P_W");
  let SourceSystem = core.getInput("SOURCE_SYS");
  let TargetSystem = core.getInput("TARGET_SYS");
  let schemaName = core.getInput("SCHEMA");
  const appSecurityToken = core.getInput("APP_SECURITY_TOKEN");

  // HEAD_REF: ${{github.head_ref}}
  // BASE_REF: ${{github.base_ref}}
  let head_ref = core.getInput("HEAD_REF");
  let base_ref = core.getInput("BASE_REF");

  console.log({ head_ref, base_ref, SourceSystem, TargetSystem, schemaName });

  const sleep = function (ms) {
    return new Promise((resolve) => setTimeout(resolve, ms));
  };

  console.log("Waiting to Sync Changes...");
  console.log(
    "-----------------------------------------------------------------"
  );
  await sleep(10000);
  console.log("Sync Completed!");
  console.log(
    "-----------------------------------------------------------------"
  );

  // let host = "40.78.156.172";
  let body_1 = {
    UserName: "niharrout",
    RepoType: "GITHUB",
    RepoName: "GITHUB-Beazley-CICD",
    ConnectionName: "Beazley-CICDTest",
    SourceSystemName: "SGSSANDBOX",
    TargetSystemName: "SANDBOX1",
    SystemType: "SNOWFLAKE",
    SchemaName: ["DEV", "CDR", "DBO", "STG", "TRANSIENT"],
    Path: "DATABASE",
    HeadBranch: "develop",
    BaseBranch: "master",
    ScriptGenerationRules: ["Include DROP statement"],
  };

  console.log("Comparing...");
  console.log(
    "-----------------------------------------------------------------"
  );

  // const response = await fetch(
  //   "http://40.78.156.172/api/v1/4dalert/database-data-change-monitor?database=decisionsigma",
  //   {
  //     method: "get",
  //     headers: {
  //       "Content-Type": "application/json",
  //       cookie: `4dalert-user-token=${Token}`,
  //     },
  //   }
  // );

  console.log("Please Wait...");
  const deployScriptResp = await fetch(
    `https://app.4dalert.com/api/v1/4d/ci/cd/generate-deployment-scripts`,
    {
      method: "post",
      body: JSON.stringify(body_1),
      headers: {
        "Content-Type": "application/json",
        "fda-security-token": `${appSecurityToken}`,
      },
    }
  );

  console.log("deployScriptResp : ", deployScriptResp);

  // const ResonseData = await response.text();
  // console.log("ResonseData : ", ResonseData);

  const GITHUB_TOKEN = core.getInput("GITHUB_TOKEN");
  const octokit = github.getOctokit(GITHUB_TOKEN);

  const { context = {} } = github;
  const { pull_request } = context.payload;

  // await octokit.rest.issues.createComment({
  //   ...context.owner,
  //   ...context.repo,
  //   issue_number: pull_request.number,
  //   body: `Thank you for submitting a pull request! We will try to review this as soon as we can.\n\n${ResonseData}`,
  // });

  console.log(
    "-----------------------------------------------------------------"
  );
  console.log("Action Completed");
  console.log(
    "-----------------------------------------------------------------"
  );

  await octokit.rest.issues.createComment({
    ...context.owner,
    ...context.repo,
    issue_number: pull_request.number,
    body: `Thank you for submitting a pull request! We will try to review this as soon as we can.`,
  });
}

run();
