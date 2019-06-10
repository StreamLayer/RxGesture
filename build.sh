#!/usr/bin/env sh -ex

rm -rf ./Example/Pods || true
rm -rf ./Carthage/Build/ || true

carthage build --no-skip-current
for fmwk in RxTest RxCocoa RxBlocking RxRelay RxSwift
do
  rm -rf ./Carthage/Build/*/${fmwk}*;
done

rm ./Carthage/Build/.RxSwift.version
rm ./*.zip || true
zip -r RxGesture.framework.zip ./Carthage/Build
