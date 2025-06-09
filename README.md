# AWS Instance Manager for macOS

[![Mac App Store Ready](https://img.shields.io/badge/Mac%20App%20Store-Ready-brightgreen)](https://developer.apple.com/app-store/)
[![Swift 5.9+](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-macOS%2013.0+-blue.svg)](https://developer.apple.com/macos/)

A professional, Mac App Store-ready AWS EC2 Instance Manager with comprehensive Free Tier monitoring, enterprise authentication, and advanced cost protection features.

## 🌟 Key Features

### 💰 **Advanced Free Tier Protection**
- **Smart Cost Monitoring**: Real-time tracking of AWS Free Tier usage with 750-hour monthly limit
- **Proactive Warnings**: Alerts at 75% and 90% usage thresholds
- **Overage Projection**: "You'll exceed free tier on June 22nd" predictions
- **Hidden Cost Detection**: Identifies non-eligible instances (t3.small, m5.large) that cost money immediately
- **Cost Estimation**: Real-time monthly cost projections and overage calculations

### 🔐 **Enterprise Authentication**
- **Multi-Factor Authentication**: Support for Virtual MFA, Hardware tokens, SMS
- **AWS IAM Role Assumption**: AssumeRole with optional MFA requirements
- **Session Management**: Automatic token refresh and secure credential storage
- **AWS SSO Ready**: Framework for AWS Single Sign-On integration
- **Keychain Security**: macOS keychain integration for secure credential storage

### 🖥️ **Native macOS Experience**
- **Menu Bar Integration**: Quick access with real-time status indicators
- **SwiftUI Interface**: Modern, native macOS design language
- **Instant Actions**: Start, stop, and reboot instances with one click
- **Real-time Updates**: Live instance status monitoring
- **Accessibility**: Full VoiceOver and accessibility support

### ⚡ **Professional Instance Management**
- **Real AWS SDK**: Direct AWS API integration (not mocked)
- **Multi-Region Support**: Manage instances across all AWS regions
- **Bulk Operations**: Start/stop multiple instances simultaneously
- **Instance Filtering**: Quick filters by state, type, and Free Tier eligibility
- **Usage Analytics**: Detailed usage patterns and cost breakdowns

## 📱 **Mac App Store Ready**

### ✅ **Full Compliance**
- **App Sandbox**: Enabled with minimal required entitlements
- **Hardened Runtime**: Security best practices implemented
- **Privacy Manifest**: Zero user tracking or data collection
- **Code Signing**: Ready for Mac App Store certificates
- **No External Dependencies**: Pure Swift Package Manager implementation

### 🛡️ **Security First**
- **Keychain Integration**: Secure credential storage using macOS keychain
- **Network Isolation**: Only connects to AWS API endpoints
- **No Telemetry**: Zero analytics or user tracking
- **Local Storage**: All data stays on your Mac

## 🚀 **Installation**

### **Build from Source**
```bash
# Clone the repository
git clone https://github.com/itrimble/aws-instance-manager.git
cd aws-instance-manager

# Build and run
swift build --configuration release
swift run
```

### **App Store Build**
```bash
# Install Mac App Store certificates first
# Then build for App Store submission
./build_appstore.sh
```

## ⚙️ **Configuration**

### **AWS Credentials Setup**

1. **Static Credentials** (Simplest)
   - AWS Access Key ID
   - AWS Secret Access Key
   - Default Region

2. **MFA Authentication** (Recommended)
   - Base credentials + MFA device
   - Automatic session token management
   - Support for multiple MFA device types

3. **Role Assumption** (Enterprise)
   - Cross-account role assumption
   - MFA-protected roles
   - Temporary credential management

### **Required AWS Permissions**
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances",
                "ec2:StartInstances",
                "ec2:StopInstances",
                "ec2:RebootInstances",
                "sts:GetCallerIdentity",
                "iam:ListMFADevices"
            ],
            "Resource": "*"
        }
    ]
}
```

## 📊 **Free Tier Monitoring**

### **Smart Usage Tracking**
- **Real-time Calculation**: Hours used this month across all eligible instances
- **Projection Algorithm**: "At current usage rate, you'll use 892 hours this month"
- **Multi-Instance Aware**: Tracks multiple t2.micro/t3.micro instances simultaneously
- **Cost Protection**: Warns about non-eligible instances before they incur charges

### **Warning System**
- 🟢 **Safe**: Under 75% usage
- 🟡 **Warning**: 75-90% usage - monitor carefully
- 🔴 **Critical**: Over 90% usage - stop instances to avoid charges
- ⚠️ **Overage Alert**: Projected to exceed 750 hours this month

### **Cost Estimation**
```
Free Tier Status: 🟡 Warning (78.2% used)
Hours Used: 586.5 / 750 hours
Projected Monthly: 892 hours
Estimated Overage Cost: $1.65
Days Until Exhausted: 8 days
```

## 🏗️ **Architecture**

### **Core Components**
- **AWSSDKProvider**: Real AWS SDK integration with comprehensive error handling
- **AWSAuthenticationManager**: Multi-method authentication with MFA support
- **FreeTierMonitor**: Advanced usage tracking and cost projection
- **KeychainManager**: Secure credential storage using macOS keychain
- **MenuBarController**: Native menu bar integration with status indicators

### **Key Technologies**
- **Swift 5.9+**: Modern Swift with async/await
- **SwiftUI**: Native macOS interface design
- **AWS SDK for Swift**: Official AWS SDK integration
- **Keychain Services**: Secure credential storage
- **Swift Package Manager**: Dependency management

## 🔧 **Development**

### **Project Structure**
```
AWSInstanceManager/
├── AWSInstanceManager/
│   ├── Models/                 # Data models
│   │   ├── AWSCredentials.swift
│   │   └── EC2Instance.swift
│   ├── Managers/              # Core business logic
│   │   ├── AWSAuthenticationManager.swift
│   │   ├── AWSSDKProvider.swift
│   │   └── KeychainManager.swift
│   ├── Views/                 # SwiftUI views
│   │   ├── AuthenticationView.swift
│   │   ├── FreeTierWarningsView.swift
│   │   └── AWSInstanceManagerView.swift
│   ├── AppDelegate.swift      # Menu bar app
│   └── main.swift            # App entry point
├── Package.swift             # Dependencies
├── build_appstore.sh        # App Store build script
└── validate_implementation.sh # Quality validation
```

### **Quality Assurance**
```bash
# Run comprehensive validation
./validate_implementation.sh

# Outputs:
# ✅ All Swift files have valid syntax
# ✅ Mac App Store compliance verified
# ✅ No hardcoded credentials detected
# ✅ Security entitlements validated
```

## 📈 **Roadmap**

### **v1.1 - Enhanced Monitoring**
- [ ] CloudWatch integration for detailed metrics
- [ ] Multi-account support
- [ ] Cost allocation tags
- [ ] Custom usage alerts

### **v1.2 - Extended AWS Services**
- [ ] RDS Free Tier monitoring
- [ ] Lambda usage tracking
- [ ] S3 storage monitoring
- [ ] Elastic IP cost warnings

### **v1.3 - Team Features**
- [ ] Shared team dashboards
- [ ] Role-based access control
- [ ] Audit logging
- [ ] Slack/Teams notifications

## 🤝 **Contributing**

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing feature'`
4. Push to branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

## 📝 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 **Acknowledgments**

- **AWS SDK for Swift Team** - Official AWS SDK integration
- **Apple Developer Community** - Mac App Store best practices
- **SwiftUI Community** - Modern macOS interface patterns

---

**⭐ If this project helps you manage AWS costs, please give it a star!**

*Built with ❤️ for the AWS community*