# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods
    pod 'Firebase/Analytics'
    pod 'Firebase/Auth'
    pod 'FirebaseUI'
    pod 'Firebase/Firestore'
    pod 'FirebaseFirestoreSwift'
end

target 'Reparo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
	shared_pods

  
  target ‘ReparoTests’ do
    inherit! :search_paths
    # Pods for testing
    shared_pods
  end

end
