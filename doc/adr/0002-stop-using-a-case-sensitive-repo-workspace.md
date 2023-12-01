# 2. Stop using a case-sensitive repo workspace

Date: 2023-12-01

## Status

Accepted

## Context

I previously used a case-sensitive APFS volume for working on projects. This pre-emptively caught filename case-sensitivity issues that would arise later on Linux filesystems.

Not all software on Macos handles case-sensitivity of volumes well. This included an issue with using `xcodebuild` in a React Native project. It's unclear whether this is an Xcode thing, a React Native tooling thing, or a third-party dependency in this scenario, but I didn't have the time or expertise to delve into it and see if it could be resolved.

These kinds of issues will probably continue/get worse the more I work with anything mobile related, so it may be better to abandon the case-sensitive volume approach now.

## Decision

Stop using a case-sensitive APFS volume at `~/w/`, and stick to the default APFS (case-insensitive) volume.

## Consequences
