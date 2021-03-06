
RSpec.describe GemSpec, type: :model do
  it "has working factory" do
    gem_spec = build(:laser_gem , gem_spec: build(:gem_spec)).gem_spec
    expect(gem_spec.save).to be true
  end

  it "checks name attribute" do
    gem_spec = build :gem_spec
    gem_spec.name = ""
    expect(gem_spec.save).to be false
  end

  it "checks info attribute" do
    gem_spec = build :gem_spec, info: ""
    expect(gem_spec.save).to be false
  end

  it "checks current_version attribute" do
    gem_spec = build :gem_spec, current_version: ""
    expect(gem_spec.save).to be false
  end

  it "checks current_version_downloads attribute" do
    gem_spec = build :gem_spec, current_version_downloads: nil
    expect(gem_spec.save).to be false
  end

  it "checks total_downloads attribute" do
    gem_spec = build :gem_spec, total_downloads: nil
    expect(gem_spec.save).to be false
  end

  it "checks rubygem_uri attribute" do
    gem_spec = build :gem_spec, rubygem_uri: ""
    expect(gem_spec.save).to be false
  end

  it "checks gem spec has laser gem using gem_spec_with_laser_gem factory" do
    gem_spec_with_laser_gem = create(:laser_gem).gem_spec
    expect(gem_spec_with_laser_gem.laser_gem).not_to be nil
  end
end
