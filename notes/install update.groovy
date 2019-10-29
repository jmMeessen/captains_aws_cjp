import com.cloudbees.jenkins.plugins.assurance.CloudBeesAssurance;

if (CloudBeesAssurance.get().getUpgradeAction().getUpgrade().isIncrementalUpgrade()) { 
  println("Starting incremental upgrade to ${CloudBeesAssurance.get().getUpgradeAction().getUpgrade()}..."); 
  CloudBeesAssurance.get().getUpgradeAction().getUpgrade().pick(false, null); 
  println("Upgrade done! Restarting..."); 
  Jenkins.instance.doQuietDown(true,0);
  Jenkins.instance.doSafeRestart(null); 
  println("Restarting done!"); 
} else { 
  println "No incremental upgrade available!" 
}
