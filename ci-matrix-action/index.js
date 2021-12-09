import core from '@actions/core';
import compareVersions from 'compare-versions';
import api from 'api-npm';
import semver from 'semver';

api.getdetails('webpack', getVersions);

async function getVersions(data) {
    /** You will have your own code to what to do with return json **/
    let latest = data['dist-tags'].latest,
        majorVersion = latest,
        latestVersionList = [latest],
        allVersions = Object.keys(data.versions)
            .sort(compareVersions)
            .reverse()
            .filter(version => semver.prerelease(version) === null) // filter pre-releases
    ;

    // console.log("latest version within %s series: %s", majorVersion.split('.')[0] + '.0.0', latest);
    while ((majorVersion = (majorVersion.split('.')[0] - 1)) >= 0) {
        majorVersion += '.0.0'
        // console.log(versions.filter(version => compareVersions.satisfies(version, '^' + majorVersion)));
        latestVersionList.push(
            allVersions
                .filter(version => compareVersions.satisfies(version, '^' + majorVersion))
                .reduce((previousValue, currentValue) => compareVersions.compare(currentValue, previousValue, '>') ? currentValue : previousValue, '0.0.0')
        )
    }
    const matrix = {
        include: latestVersionList
            .map(version => ({
                name: "Build and push AWS CDK CLI " + version,
                tags: [version, version === latest ? 'latest' : ''].filter(tag => tag.length > 0)
            }))
    };

    core.info(`Matrix: ${JSON.stringify(matrix, null, 2)}`);
    core.setOutput('matrix', JSON.stringify(matrix))
}
